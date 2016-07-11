# frozen_string_literal: true
source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '5.0.0'
# Run with puma
gem 'puma'
# Use postgres as main database
gem 'pg'
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
# Use font awesome gem to use sprockets
gem 'font-awesome-sass', '~> 4.6.2'
# Bootstrap
gem 'bootstrap-sass', '~> 3.3.6'
# https://github.com/bluerail/twitter-bootstrap-rails-confirm
gem 'twitter-bootstrap-rails-confirm'

# Authorization & Authentication
gem 'devise'
gem 'pundit'
gem 'rolify'

# Badges
gem 'merit'
# We need this gem that was removed from Rails 5 core to merit work
gem 'activemodel-serializers-xml'
# Paginator
gem 'public_activity'
# Language selector
gem 'http_accept_language'

# Datepicker
# https://github.com/Nerian/bootstrap-datepicker-rails
gem 'bootstrap-datepicker-rails'
# Date and Time Picker
# https://github.com/TrevorS/bootstrap3-datetimepicker-rails
gem 'momentjs-rails', '>= 2.9.0'
gem 'bootstrap3-datetimepicker-rails', '~> 4.17.37'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  # Use RSpec to do testing
  gem 'rspec-rails', '~> 3.5'
  gem 'rails-controller-testing'
  # Use RuboCop as Linter
  gem 'rubocop', '~> 0.40.0', require: false
  gem 'rubocop-rspec', '~> 1.5.0', require: false
  gem 'factory_girl_rails'
  gem 'kaminari-rspec'
  gem 'listen'
  gem 'dotenv-rails'
  gem 'wdm', '>= 0.1.0' if Gem.win_platform?
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  # Use guard to run the tests
  gem 'guard-rspec', require: false
end

group :production do
  gem 'rails_12factor'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
