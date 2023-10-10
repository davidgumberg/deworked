source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Versions of our main deps
ruby "3.2.2"
gem "rails", "~> 7.1"
gem "puma", "~> 6.4"

# Rails default gems and asset pipeline
#
# Asset Pipeline
gem "sprockets-rails"
# Build ActiveStorage variants
gem "image_processing"
# tailwindcss
gem "tailwindcss-rails", "~> 2.0"
# JS importmaps
gem "importmap-rails"
# Hotwire's turbolinks and turboframes
gem "turbo-rails"
# Hotwire's stimulus
gem "stimulus-rails"
# JSON API builder
gem "jbuilder"
# Procfile runner
gem "foreman", "~> 0.87"
# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

# Gems that extend the Rails default
#
# authentication
gem "devise"
# pagination
gem "pagy", "~> 6.0"
# View Compenentization
gem "view_component"

# Ruby utility gems
#
# Fetch works data from API's
gem "fetchworks", "~> 0.1"


group :development, :test do
  # Sqlite DB for dev and test
  gem "sqlite3", "~> 1.6"

  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[mri mingw x64_mingw]
  gem "brakeman"

  # ViewComponent Previews
  gem "lookbook"

  # Rubocop gems
  gem "rubocop"
  gem "rubocop-rails"
  gem "standard"
  gem "standard-rails"

  # rspec
  gem "rspec"
  gem "rspec-rails"
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
end

group :production do
  # PostgreSQL in prod
  gem "pg", "~>1.5"
  # S3 for ActiveStorage blobs
  gem "aws-sdk-s3", "~> 1.136"
end
