source 'https://rubygems.org'

ruby '2.2.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.3'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails', '4.0.4'
gem 'jquery-ui-rails', '5.0.5'

# Adds AJAX file uploads
gem 'remotipart', '~> 1.2'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks', '2.5.3'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'

gem 'devise', '3.5.2'
gem 'omniauth-facebook', '2.0.1'
gem 'omniauth-github', '1.1.2'
gem 'omniauth-google-oauth2', '0.2.6' # https://github.com/zquestz/omniauth-google-oauth2/issues/195

# For documents attachment service
gem "paperclip", "~> 4.3"

# Amazon S3 storage
gem 'aws-sdk', '< 2.0'  # https://github.com/thoughtbot/paperclip/issues/1764

gem 'pg', '0.15.1'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', '0.4.0', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Use sqlite3 as the database for Active Record
  # gem 'sqlite3'

  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring', '1.3.6'
  gem 'rspec-rails', '3.3.3'
  gem "factory_girl_rails", "~> 4.4.1"
  gem 'rubocop', require: false
  gem 'seed_dump'

  # load environment variables from .env
  gem 'dotenv-rails'
end

gem "codeclimate-test-reporter", group: :test, require: nil

group :test do
  gem "faker", "~> 1.4.3"
  gem "capybara", "~> 2.4.3"
  gem "database_cleaner", "~> 1.3.0"
  gem "launchy", "~> 2.4.2"
  gem "selenium-webdriver", "~> 2.43.0"
end

group :production do
  gem 'rails_12factor', '0.0.2'
end

