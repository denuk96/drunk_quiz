source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'jbuilder', '~> 2.7'
gem 'pg', '~> 1.2', '>= 1.2.3'
gem 'puma', '~> 5.0'
gem 'rails', '~> 6.1.0'
gem 'rubocop'
gem 'sass-rails', '>= 6'
gem 'simple_form'
gem 'slim'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 5.0'
# == redis ==
gem 'hiredis'
gem 'redis', '~> 4.0'
# gem 'rails_performance'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]

  gem 'rspec'
  gem 'rspec-core'
  gem 'rspec-expectations'
  gem 'rspec-mocks'
  gem 'rspec-rails'
  gem 'rspec-support'

  gem 'brakeman'
  gem 'bundler-audit'
end

group :development do
  gem 'annotate', '~> 3.1', '>= 3.1.1'
  gem 'listen', '~> 3.2'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'spring'
  gem 'web-console', '>= 4.0.3'
end

group :test do
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
