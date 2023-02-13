require 'open-uri'
require 'sidekiq'

Sidekiq.configure_server do |config|
  config.redis = { url: "redis://#{ENV['REDIS_HOST']}:#{ENV['REDIS_PORT']}" }
end

class SomeWorker
  include Sidekiq::Worker

  def perform
    content = URI.parse('http://www.google.com').read

    File.open('content/google.html', 'w') { |f| f.write(content) }
  end
end
