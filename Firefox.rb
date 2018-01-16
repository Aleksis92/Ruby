require 'selenium-webdriver'
require 'faker'
Selenium::WebDriver::Firefox.driver_path="C:/Ruby24-x64/bin/geckodriver.exe"

name = Faker::Name.first_name
password = Faker::Internet.password

driver1=Selenium::WebDriver.for :firefox
driver1.get("https://tempail.com/ru/")
mail = driver1.find_element(:id, "eposta_adres").attribute('value')
sleep(3.0)
driver=Selenium::WebDriver.for :firefox

driver.get("https://dev.by/registration")

driver.find_element(:id, "user_username").send_keys(name)

driver.find_element(:id, "user_email").send_keys(mail)

driver.find_element(:id, "user_password").send_keys(password)

driver.find_element(:id, "user_password_confirmation").send_keys(password)

driver.find_element(:id, "user_agreement").click

driver.find_element(:name, "commit").click

#driver.quit
#driver1.quit



