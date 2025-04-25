redis_config = Rails.env.development? ? { url: "redis://localhost:6379/1" } : { url: ENV.fetch("REDIS_URL", nil) }

Sidekiq.configure_server do |config|
  config.redis = redis_config
end

Sidekiq.configure_client do |config|
  config.redis = redis_config
end
