# frozen_string_literal: true
source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.6'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
# Pager
gem 'kaminari'
# Use NProgress to add loader
gem 'nprogress-rails'
# Use font awesome gem to use sprockets
gem 'font-awesome-sass', '~> 4.6.2'
# Bootstrap
gem 'bootstrap-sass', '~> 3.3.6'
# https://github.com/bluerail/twitter-bootstrap-rails-confirm
gem 'twitter-bootstrap-rails-confirm'

gem 'devise'
gem 'pundit'
gem 'public_activity'
# Language selector
gem 'http_accept_language'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  # Use RSpec to do testing
  gem 'rspec-rails', '~> 3.4'
  # Use RuboCop as Linter
  gem 'rubocop', '~> 0.40.0', require: false

  gem 'rubocop-rspec', '~> 1.5.0', require: false

  gem 'factory_girl_rails'

  gem 'kaminari-rspec'

  # Use sqlite3 as the database for Active Record
  if RUBY_PLATFORM =~ /x64-mingw32/
    gem 'sqlite3', ' ~> 1.3.11-x64-mingw32', platform: [:mingw, :mswin, :x64_mingw, :jruby]
  else
    gem 'sqlite3', platform: :ruby
  end
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  # Use guard to run the tests
  gem 'guard-rspec', require: false
end

group :production do
  gem 'pg'
end
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
