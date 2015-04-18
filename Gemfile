source 'https://rubygems.org'
ruby '2.2.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.1'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use AMS for json serializers
gem 'active_model_serializers', '0.9.3'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
group :development do
  gem 'capistrano-rails', '~> 1.1'
  gem 'capistrano-bundler', '~> 1.1'
  gem 'capistrano-rbenv', "~> 2.0"
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  gem 'rspec-rails', '~> 3.0'
  gem 'pry-rails'
end

group :production do
  # Use Puma as the app server
  gem 'puma', '~> 2.11'
end
