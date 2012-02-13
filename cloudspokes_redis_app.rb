require 'rubygems'
require 'sinatra/base'

require 'uri'
require 'net/http'
require 'json'
require 'redis'
require 'set'
require 'haml'

class CloudspokesRedisApp < Sinatra::Base
  get '/' do
    haml :index
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

    haml :updated
  end

  get /\/random(\/)?$/ do
    get_random_loans 10
  end

  get '/random/:numentries' do |numentries|
    get_random_loans numentries.to_i
  end

  helpers do
    def get_random_loans(numentries)
      redis = Redis.new

      id_set = Set.new
      num_loans = redis.dbsize
      while id_set.length < [numentries, num_loans].min
        id_set << redis.randomkey
      end

      loans = Array.new
      id_set.each do |key|
        loans.push JSON.parse(redis.get(key))
      end

      feeds_json = Hash.new
      feeds_json['loans'] = loans

      feeds_json.to_json
    end
  end
end
