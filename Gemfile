source 'https://rubygems.org'

gem 'rails', '3.2.6'
gem 'pg'
gem 'jquery-rails'
gem 'simple_form'
gem 'prawn'
gem 'twitter-bootstrap-rails'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.0'

# Deploy with Capistrano
gem 'capistrano'

group :development do
  gem 'pry-rails'

  # Guard
  gem 'guard'
  gem 'rb-inotify', :require => false
  gem 'rb-fsevent', :require => false
  gem 'rb-fchange', :require => false

  # Guard plugins
  gem 'guard-rspec'
  gem 'guard-spork'
  gem 'guard-bundler'
  gem 'guard-migrate'
  gem 'guard-evergreen'
end

group :development, :test do
  gem 'rspec-rails'

  # Capybara using headless PhantomJS browser
  gem 'capybara'
  gem 'poltergeist'

  # Factories, not fixtures
  gem 'factory_girl_rails'

  # Speeds testing by keeping Rails framework running in background
  gem 'spork'

  # Use Evergreen for JavaScript testing
  gem 'evergreen', :require => 'evergreen/rails'

  # Database Cleaner resets the database between test runs
  gem 'database_cleaner'
end

group :test do
  # Growl notifications
  gem 'growl'
end