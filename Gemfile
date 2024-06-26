# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 7.0.1'
# Use postgresql as the database for Active Record
#gem 'pg'
gem 'sqlite3'
# Use Puma as the app server
gem 'puma'
# Use SCSS for stylesheets
gem 'sass-rails'
# Use Terser as compressor for JavaScript assets
# gem 'uglifier', '>= 1.3.0'
gem 'terser'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

gem 'i18n'
gem 'rails-i18n', '~> 7.0.0' # For 7.0.0

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'

gem 'activeadmin'
gem 'devise'

gem 'auto_strip_attributes'
gem 'bootstrap', '~>4.3.0'
gem 'jquery-rails'
gem 'rack-canonical-host'
gem 'recaptcha', require: 'recaptcha/rails'
gem 'scenic'
gem 'scenic_sqlite_adapter'

gem 'ransack', '>= 2.5.0'
gem 'passenger'

source 'https://rails-assets.org' do
  gem 'rails-assets-jquery-waypoints'
end

group :development, :test do
  gem 'rubocop'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara'
  gem 'selenium-webdriver'
  gem "capistrano", "~> 3.17", require: false
  gem 'capistrano-rails'
  gem 'capistrano-rbenv'
  gem 'capistrano-passenger'
  gem 'capistrano-bundler', '~> 2.0'
  gem "capistrano-secrets-yml"
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'listen'
  gem 'web-console'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen'
end
