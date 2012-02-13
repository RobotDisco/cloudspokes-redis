# Generated by cucumber-sinatra. (2012-02-09 23:21:04 -0500)

ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', '..', 'lib/cloudspokes_redis_app.rb')

require 'capybara'
require 'capybara/cucumber'
require 'json_spec/cucumber'
require 'rspec'

Capybara.app = CloudspokesRedisApp

class CloudspokesRedisAppWorld
  include Capybara::DSL
  include RSpec::Expectations
  include RSpec::Matchers
end

World do
  CloudspokesRedisAppWorld.new
end

def last_json
  page.source
end