source "https://rubygems.org"

ruby "3.2.1"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.1.1"

# Use mysql as the database for Active Record
gem "mysql2", "~> 0.5"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", ">= 5.0"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
# gem "jbuilder"

# Use Redis adapter to run Action Cable in production
# gem "redis", ">= 4.0.1"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ windows jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin Ajax possible
gem "rack-cors"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri windows ]

  gem 'rspec-rails'
  gem 'rbs_rails', require: false
  gem 'orthoses', "~> 1.13.0", require: false
  gem 'orthoses-rails', "~> 1.4.0", require: false
  gem 'steep', require: false
  gem "typeprof", require: false
end

group :development do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

gem 'ridgepole' # schema https://github.com/ridgepole/ridgepole
gem 'graphql' # graphql
# gem "graphiql-rails", group: :development => https://github.com/rmosolgo/graphiql-rails/issues/108 起動しない
gem 'pry-rails', group: :development
gem 'activerecord-import' # インポート
gem 'roo', "~> 2.10.0" # excel読み込み
gem 'roo-xls' # rooで使用するので必要
gem 'devise_token_auth', :git => 'https://github.com/single-stop-tony/devise_token_auth' # トークン認証
