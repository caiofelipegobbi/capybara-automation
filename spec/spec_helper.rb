require 'bundler'
require 'capybara/rspec'
require 'capybara/dsl'
require 'selenium-webdriver'

Capybara.register_driver :selenium_chrome do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument('--start-maximized') # Start the browser maximized
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

Capybara.app_host = 'https://automation-sandbox-python-mpywqjbdza-uc.a.run.app'
Capybara.default_driver = :selenium_chrome
#Capybara.default_driver = :selenium_chrome_headless
Capybara.default_max_wait_time = 30 #making it 30 seconds because the application takes a while to load.


#Setting the formatter automatically instead of specifying on each execution.
RSpec.configure do |config|
  config.formatter = :documentation
end