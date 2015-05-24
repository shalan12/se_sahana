source 'https://rubygems.org'

gem 'rails', '3.2.18'

gem 'sqlite3', :group => [:development, :test] 
gem 'cucumber-rails', :require => false
gem 'cucumber'
gem "cucumber-rails-training-wheels", :group => :test
gem 'simplecov', :require => false, :group => :test
gem 'database_cleaner'
gem 'geocoder'
gem 'faker'
gem 'fabrication'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'haml', '>= 3.0.25'
  gem 'uglifier', '>= 1.0.3'
  gem 'bower-rails'
end

group :development, :test do
  gem 'rspec-rails',      ">= 2.0.0.beta"
end

group :production do 
  gem 'thin'
  gem 'pg' 
end
