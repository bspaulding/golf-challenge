ruby "1.9.3", :engine => "rbx", :engine_version => "2.0.0.rc1"

source 'https://rubygems.org'

gem 'active_model_serializers'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'
gem 'rails_12factor', :group => :production # for heroku
gem 'puma'
gem 'foreman', :group => :development

gem 'newrelic_rpm', :group => :production

platforms :ruby do
  gem 'sqlite3', :group => :development
  gem 'pg', :group => :production
end

platforms :jruby do
  gem 'jdbc-sqlite3', :group => :development
  gem 'activerecord-jdbcsqlite3-adapter', '1.3.0.beta2', :group => :development
  gem 'activerecord-jdbcpostgresql-adapter', :group => :production
end

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
