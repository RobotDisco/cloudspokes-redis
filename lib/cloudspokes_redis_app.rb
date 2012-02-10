require 'rubygems'
require 'sinatra/base'

class CucumberRedisApp < Sinatra::Base
  get '/' do
    'Hello Sailor!'
  end

  get '/update' do
    'I updated your Kiva info!!!'
  end
end
