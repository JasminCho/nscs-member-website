source 'https://rubygems.org'

gem 'simplecov'

gem 'capybara', '~>2.18'
gem 'gherkin', '~> 5.0'
gem 'rspec', '~> 3.0'
gem 'rails',        '5.1.5'
gem 'puma',         '3.9.1'
gem 'sass-rails',   '5.0.6'
gem 'uglifier',     '3.2.0'
gem 'coffee-rails', '4.2.2'
gem 'jquery-rails', '4.3.1'
gem 'turbolinks',   '5.0.1'
gem 'jbuilder',     '2.7.0'
#gem 'figaro'
gem 'bootstrap-sass'
gem 'bootstrap_jt', '~> 0.1.0'
gem 'aws-sdk-rails'
gem 'aws-sdk', '~> 3'
gem 'aws-sdk-v1'
gem 'materialize-sass'

# for authentication
gem 'omniauth-google-oauth2'
# for calendar
gem 'google-api-client', '0.8.2', :require => ['google/api_client']
#gem 'google-api-client', require:'google/apis/calendar_v3'
group :development, :test do
  gem 'sqlite3', '1.3.13'
  gem 'byebug',  '9.0.6', platform: :mri
  gem 'rspec-rails', '~> 3.7'
end

group :development do
  gem 'web-console',           '3.5.1'
  gem 'listen',                '3.1.5'
  gem 'spring',                '2.0.2'
  gem 'spring-watcher-listen', '2.0.1'
end

group :test do
  gem 'rails-controller-testing', '1.0.2'
  gem 'minitest-reporters',       '1.1.14'
  gem 'guard',                    '2.13.0'
  gem 'guard-minitest',           '2.4.4'
end

group :production do
  gem 'pg', '0.18.4'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :test, :development do
  gem 'cucumber-rails', :require => false
  # database_cleaner is not required, but highly recommended
  gem 'database_cleaner'
end
