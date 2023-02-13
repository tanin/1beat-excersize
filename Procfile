web: bundle exec rackup --host 0.0.0.0 -p 80
worker: bundle exec sidekiq -r ./lib/some_worker.rb -C ./config/sidekiq.yml
