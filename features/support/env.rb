require 'capybara'
require 'capybara/cucumber'
require 'rspec'
require 'rubygems'
# require 'test/unit'
# require 'capybara/rspec'
# require 'cucumber/rails'
require 'selenium/webdriver'

Capybara.configure do |config|
    config.default_driver = :selenium_chrome
    # config.include Capybara::DSL
    
    # config.default_driver = :selenium #<== firefox

Capybara.default_max_wait_time = 10

end