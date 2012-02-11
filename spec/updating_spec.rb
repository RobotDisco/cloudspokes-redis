require "rspec"
require 'net/http'

describe "CloudspokesRedisApp" do

  it "should request a feed from Kiva" do
    Net::HTTP.should_receive(:get).with(URI.parse('http://api.kivaws.org/v1/loans/newest.json'))

    get '/update'
  end
end