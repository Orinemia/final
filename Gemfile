source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.2'

# Use postgresql as the database for Active Record
gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

#let's experiment with this
gem 'bootstrap-sass', '2.3.2.0'
gem 'sprockets', '2.11.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

#To handle the testing of each user's avatar
gem 'gravatar_image_tag', '0.1.0'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.1.2'

group :development, :test, :production do
   gem 'rspec-rails', '~> 2.13.1'
   gem 'rspec-core', '~> 2.13.0'
   gem 'guard-rspec'
   gem 'guard-spork'
   gem 'spork-rails'
end

group :production , :development, :test do
 gem 'rails_12factor'
end

# Have to use capybara 1.1.2 to ensure that invisible text like my tiels are not ignored in the test
 gem 'capybara', '1.1.2'

 gem 'protected_attributes'

group :test do
	gem 'factory_girl_rails', '4.2.1'
end


# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
