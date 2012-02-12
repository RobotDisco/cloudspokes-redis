require "rspec"
require 'net/http'
require 'json'
require 'redis'

describe "CloudspokesRedisApp" do

  it "should request a feed from Kiva" do
    Net::HTTP.should_receive(:get).with(URI.parse('http://api.kivaws.org/v1/loans/newest.json'))

    get '/update'
  end

  it "should parse Kiva's JSON response" do
    JSON.should_receive(:parse)

    get '/update'
  end

  it "should add every loan into Redis" do
    test_json = File.read 'spec/test_feed.json'
    test_feed = JSON.parse test_json

    Net::HTTP.should_receive(:get).with(URI.parse('http://api.kivaws.org/v1/loans/newest.json')) do
      test_json
    end

    num_new_loans = test_feed['loans'].length
    Redis.should_receive(:set).exactly(num_new_loans).times
    
    get '/update'
  end
end