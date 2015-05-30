require 'simplecov'
SimpleCov.start
require 'capybara/rspec'

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.order = "random"
end

Capybara.javascript_driver = :webkit
