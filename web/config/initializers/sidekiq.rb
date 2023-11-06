Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://redis:6379/0' }

  config.logger = Logger.new(Rails.root.join('log', 'sidekiq_srv.log'))
end

Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://redis:6379/0' }

  config.logger = Logger.new(Rails.root.join('log', 'sidekiq_cli.log'))
end
