require 'rspec'
require 'redis'
require 'json'

describe 'Grabbing N random feeds' do

  it "should return N loan entries from redis" do
    LOANS_TO_GRAB = 10
    LOANS_POPULATED = 20
    redis = double("Redis instance")
    Redis.should_receive(:new).and_return redis

    # Since randomly choosing a key could produce duplicates, it's possible
    # we had to discard some duplicate random selections.
    redis.should_receive(:randomkey).at_least(LOANS_TO_GRAB).times.and_return do
      Random.rand(LOANS_POPULATED)
    end
    redis.should_receive(:dbsize).and_return LOANS_POPULATED
    redis.should_receive(:get).exactly(LOANS_TO_GRAB).times.and_return "{}"

    get '/random/' + LOANS_TO_GRAB.to_s
  end
end