require 'rubygems'
require 'sinatra/base'

require 'uri'
require 'net/http'

class CloudspokesRedisApp < Sinatra::Base
  get '/' do
    'Hello Sailor!'
  end

  get '/update' do
    uri = URI.parse 'http://api.kivaws.org/v1/loans/newest.json'
    req = Net::HTTP.get(uri)

    'I updated your Kiva info!!!'
  end
end
