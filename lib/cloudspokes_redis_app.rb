require 'rubygems'
require 'sinatra/base'

require 'uri'
require 'net/http'
require 'json'
require 'redis'

class CloudspokesRedisApp < Sinatra::Base
  get '/' do
    'Hello Sailor!'
  end

  get '/update' do
    uri = URI.parse 'http://api.kivaws.org/v1/loans/newest.json'
    kiva_json = Net::HTTP.get(uri)
    kiva = JSON.parse kiva_json

    redis = Redis.new

    kiva['loans'].each do |loan|
      loan_json = loan.to_json
      redis.set(loan['id'], loan_json)
    end

    'I updated your Kiva info!!!'
  end
end
