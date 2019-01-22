require 'capybara'
require 'capybara/cucumber'
require 'rspec'

Capybara.configure do |config|
    config.default_driver = :selenium_chrome
    
    # config.default_driver = :selenium #<== firefox

Capybara.default_max_wait_time = 10

end