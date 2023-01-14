source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'
gem 'rails', '~> 7.0.3', '>= 7.0.3.1'
gem 'sprockets-rails'
gem 'pg', '~> 1.4', '>= 1.4.3'
gem 'puma', '~> 5.0'
gem 'jsbundling-rails'
gem 'turbo-rails'
gem 'stimulus-rails'
gem 'cssbundling-rails'
gem 'jbuilder'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'bootsnap', require: false
gem 'friendly_id', '~> 5.4', '>= 5.4.2'
gem 'image_processing', '~> 1.2'
gem 'pagy', '~> 5.10', '>= 5.10.1'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem 'web-console'
  gem 'dotenv-rails', '~> 2.8', '>= 2.8.1'
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webdrivers'
  gem 'rspec-rails', '~> 6.0'
end
gem 'devise', '~> 4.8', '>= 4.8.1'

group :development, :test do
  gem 'faker', git: 'https://github.com/faker-ruby/faker.git', branch: 'main', require: false
  gem 'htmlbeautifier'
  gem 'ruby-progressbar', '~> 1.8', '>= 1.8.1'
  gem 'solargraph', '~> 0.45.0'
  gem 'solargraph-rails', '~> 0.3.1'
end
