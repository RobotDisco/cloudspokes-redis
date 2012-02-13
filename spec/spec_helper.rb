require File.join(File.dirname(__FILE__), '..', 'cloudspokes_redis_app.rb')

require 'sinatra'
require 'rack/test'
require 'json_spec'

# setup test environment
set :environment, :test
set :run, false
set :raise_errors, true
set :logging, false

def app
  CloudspokesRedisApp
end

RSpec.configure do |config|
  config.include Rack::Test::Methods
end

RSpec.configure do |config|
  config.include JsonSpec::Helpers
end