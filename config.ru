require 'sinatra/base'
require 'open-uri'
require "rubygems"
require "bundler"
require 'sidekiq/web'
require_relative 'lib/some_worker'
Bundler.require(:default)

Sidekiq.configure_client do |config|
  config.redis = { url: "redis://#{ENV['REDIS_HOST']}:#{ENV['REDIS_PORT']}" }
end

class App < Sinatra::Base
  get '/healthcheck' do
    '<h1>I am heanthy</h1>'
  end

  get '/google' do
    SomeWorker.perform_async

    'done'
  end
end

run Rack::URLMap.new('/' => App, '/sidekiq' => Sidekiq::Web)
