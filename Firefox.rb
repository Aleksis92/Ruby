require 'selenium-webdriver'
require 'faker'
Selenium::WebDriver::Firefox.driver_path="C:/Ruby22-x64/bin/geckodriver-v0.19.1-win64/geckodriver.exe"

driver=Selenium::WebDriver.for :firefox
driver1=Selenium::WebDriver.for :firefox
name = Faker::Name.first_name
password = Faker::Internet.password
driver1.get("http://mailcatch.com/en/temporary-inbox?box=" + name)
driver.get("https://dev.by/registration")

driver.find_element(:id, "user_username").send_keys(name)

driver.find_element(:id, "user_email").send_keys(name + "@mailcatch.com")

driver.find_element(:id, "user_password").send_keys(password)

driver.find_element(:id, "user_password_confirmation").send_keys(password)

driver.find_element(:id, "user_agreement").click

driver.find_element(:name, "commit").click

#driver.quit
#driver1.quit
