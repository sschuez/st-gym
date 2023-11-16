Sidekiq.configure_server do |config|
  config.redis = { url: "redis://49.13.123.144:6379/1" }
end

Sidekiq.configure_client do |config|
  config.redis = { url: "redis://49.13.123.144:6379/1" }
end
