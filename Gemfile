source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.0"

gem "rails", "~> 7.0.0"
gem "sprockets-rails"
gem "pg"  # PostgreSQL用のgem
gem "puma", "~> 5.0"
gem "jbuilder"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false
gem 'devise'
gem 'turbo-rails'

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem 'mini_magick'
  gem 'image_processing', '~> 1.2'
end

group :development do
  gem "web-console", "~> 4.0"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end