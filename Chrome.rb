require 'selenium-webdriver'
require 'faker'
Selenium::WebDriver::Chrome.driver_path="C:/Ruby22-x64/bin/chromedriver_win32/chromedriver.exe"
caps = Selenium::WebDriver::Remote::Capabilities.chrome(:chrome_options => {detach: true})

driver=Selenium::WebDriver.for :chrome, desired_capabilities: caps
driver1=Selenium::WebDriver.for :chrome, desired_capabilities: caps

name = Faker::Name.first_name
password = Faker::Internet.password
#driver1.get("http://mailcatch.com/en/temporary-inbox?box=" + name)
#sleep(10.0)
driver.get("https://dev.by/registration")

driver.find_element(:id, "user_username").send_keys(name)

driver.find_element(:id, "user_email").send_keys("sdklfjglskdfg@mailcatch.com")

driver.find_element(:id, "user_password").send_keys(password)

driver.find_element(:id, "user_password_confirmation").send_keys(password)

driver.find_element(:id, "user_agreement").click

driver.find_element(:name, "commit").click

#driver.quit
#driver1.quit