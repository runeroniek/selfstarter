source 'https://rubygems.org'
ruby '1.9.3'


gem 'rails', '~> 3.2.8'
gem 'inherited_resources'
gem 'slim-rails'

group :development do
  gem 'better_errors'
  gem 'sqlite3'
  gem 'pry-rails'
end

group :production do
  gem 'thin'
  gem 'pg'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

group :development, :test do
  gem 'rspec-rails', '~> 2.0'
end

group :test do
  gem 'machinist'
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
  gem 'shoulda'
end

# jQuery
gem 'jquery-rails'


# MyMoip Gem
gem 'mymoip', git: 'git://github.com/Irio/mymoip.git'
