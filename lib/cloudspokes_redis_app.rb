require 'rubygems'
require 'sinatra/base'

require 'uri'
require 'net/http'
require 'json'

class CloudspokesRedisApp < Sinatra::Base
  get '/' do
    'Hello Sailor!'
  end

  get '/update' do
    uri = URI.parse 'http://api.kivaws.org/v1/loans/newest.json'
    kiva_json = Net::HTTP.get(uri)
    kiva = JSON.parse kiva_json

    'I updated your Kiva info!!!'
  end
end
