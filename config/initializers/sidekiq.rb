$redis = Redis.new

url = ENV["REDIS_URL"]

if url
  Sidekiq.configure_server do |config|
    config.redis = { url: url }
    # schedule_file = "config/schedule.yml"
    # if File.exists?(schedule_file)
      # Sidekiq::Cron::Job.load_from_hash YAML.load_file(schedule_file)
    # end
  end

  Sidekiq.configure_client do |config|
    config.redis = { url: url }
  end
end

