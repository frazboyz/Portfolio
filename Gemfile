source 'https://rubygems.org'

gem 'rails', '4.2.1' # Specify the ruby on rails version
gem 'jquery-rails' # Use jquery as the JavaScript library
gem 'carrierwave' # Use carrier wave for image storage/uploads

# Development gems
group :development do
  # Use sqlite3 as a development database
  gem 'sqlite3'
  # Windows does not include zoneinfo files, so bundle the tzinfo-data gem
  # gem 'tzinfo-data', platforms: [:mingw, :mswin]
end

# Production gems
group :production do
  gem 'unicorn' # Unicorn app server
  gem 'pg' # Postgresql as the production database
end
