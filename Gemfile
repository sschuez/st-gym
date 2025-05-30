source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.4.1"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 8.0.2"

gem "propshaft"

# Use postgresql as the database for Active Record
# gem "pg", "~> 1.1"
gem "sqlite3"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 6.6"

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "importmap-rails"

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder", "~> 2.7"

# Use Redis adapter to run Action Cable in production
gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
gem "image_processing", "~> 1.2"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[mri mingw x64_mingw]
  gem "rspec-rails"
  gem "factory_bot_rails"
  gem "rubocop", require: false
  gem "rubocop-rails", require: false
  gem "rubocop-performance", require: false
  gem "rubocop-capybara", require: false
  gem "standard", require: false
  gem "erb_lint", require: false
  gem "htmlbeautifier", require: false
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # gem 'bullet', group: 'development'

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
  gem "foreman"
  gem "ruby-lsp"
  gem "hotwire-spark"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "pundit-matchers", "~> 2.1"
  gem "capybara"
  gem "database_cleaner"
end

# Added
gem "devise", github: "heartcombo/devise", branch: "main"
gem "pundit"
gem "dartsass-rails"
gem "bootstrap"
gem "simple_form"
gem "faraday"
gem "requestjs-rails"
gem "acts_as_list", "~> 1.0"
gem "ruby-progressbar"
gem "prawn", "~> 2.4"
gem "prawn-table", "~> 0.2.2"
gem "prawn-emoji", "~> 5.3"
gem "matrix" # Required explicitly for latest ruby version
gem "sidekiq"
# gem "sidekiq-failures", "~> 1.0"
gem "whenever", require: false
gem "byebug", platforms: %i[mri mingw x64_mingw]
gem "pagy", "~> 6.0"
gem "marginalia", "~> 1.11"
gem "cloudinary"

gem "dockerfile-rails", ">= 1.5", group: :development
gem "rack-session"

gem "nio4r", "~> 2.7", ">= 2.7.4"
gem "observer"

# Use the database-backed adapters for Rails.cache, Active Job, and Action Cable
gem "thruster", require: false
gem "solid_cache"
gem "solid_queue"
gem "solid_cable"
