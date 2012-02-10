require 'rubygems'
require 'sinatra/base'

class CucumberRedisApp < Sinatra::Base
  get '/' do
    'Hello Sailor!'
  end
end
