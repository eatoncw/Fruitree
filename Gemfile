source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'

gem 'jquery-ui-rails'
gem 'simple_form'
gem "paperclip", "~> 5.0.0"
gem 'remotipart', '~> 1.3', '>= 1.3.1'
gem 'aws-sdk', '~> 2.3'

gem 'bootstrap', '~> 4.0.0.alpha5'
	source 'https://rails-assets.org' do
  	gem 'rails-assets-tether', '>= 1.1.0'
	end
gem "font-awesome-rails"
gem "breadcrumbs_on_rails"
gem 'will_paginate', '~> 3.1.0'

gem 'devise'
gem 'cancancan', '~> 1.10'
gem 'stripe'
gem 'dalli'



group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'sqlite3'
  gem 'rspec-rails'
  gem 'factory_girl_rails','~> 4.0'
  gem 'rails-controller-testing'
  gem 'brakeman', :require => false

end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :production do
  gem 'pg'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
