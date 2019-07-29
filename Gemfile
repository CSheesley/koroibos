source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.4.1'

gem 'active_model_serializers'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'rails', '~> 5.2.3'

group :development, :test do
  gem 'factory_bot_rails'
  gem 'faker', :git => 'https://github.com/stympy/faker.git', :branch => 'master'
  gem 'pry'
  gem 'rspec_junit_formatter'
  gem 'rspec-rails'
  gem 'simplecov'
  gem 'shoulda-matchers'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
