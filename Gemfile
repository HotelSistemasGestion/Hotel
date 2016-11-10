source 'http://rubygems.org'


#genera los sacaffold ya con bootstrap
gem 'bootstrap-generators', '~> 3.3.4'
#gema autenticacion
gem 'devise'
#iconos lindos
gem "font-awesome-rails"
#complementos de jquery
gem 'jquery-easing-rails'
gem 'stellar-js-rails'
gem 'magnific-popup-rails', '~> 1.1.0'
gem 'waypoints-rails'
#Lo que se necesita para bootstrap
gem 'bootstrap-sass', '~> 3.3.1'
gem 'autoprefixer-rails'
#Gema Para usar captcha
gem "recaptcha", require: "recaptcha/rails"
#bootstrap datepicker
gem 'bootstrap-datepicker-rails', :require => 'bootstrap-datepicker-rails',:git => 'https://github.com/Nerian/bootstrap-datepicker-rails.git'
#Gema de autocompletado
gem 'rails4-autocomplete'
gem 'jquery-ui-rails'

gem 'jquery-form-validator-rails'

gem 'bootstrap_form'
# para el data-table
gem 'jquery-datatables-rails'
gem 'kaminari'
gem 'bootstrap-kaminari-views'
#gem 'ransack', github: 'activerecord-hackery/ransack' #para buscar
gem 'kaminari-bootstrap'
#gema para paginacion de tablas
gem 'will_paginate', '~> 3.1.0'
gem 'will_paginate-bootstrap'
gem 'sprockets-rails', '2.3.3'
gem 'filterrific'

#formularios anidados
gem 'nested_form'
#Envios de email
gem 'sendgrid-rails', '~> 2.0'

gem 'carrierwave'
gem 'cloudinary'

#Styling hmtl emails
gem 'nokogiri'
gem 'premailer-rails'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5.1'
# Use sqlite3 as the database for Active Record

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'momentjs-rails'
gem 'bootstrap-daterangepicker-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
gem 'validates_email_format_of'
# Use Unicorn as the app server
# gem 'unicorn'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
gem 'cancancan', '~> 1.10'

#agregue gemas para funcionamiento de mapas
#gem 'geocoder'
gem 'gmaps4rails'



group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
end

group :development, :production do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'pg'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  #gem 'sqlite3'
end

group :production do
	#configuramos nuestro entorno de produccion(Heroku) 
	gem 'rails_12factor'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

