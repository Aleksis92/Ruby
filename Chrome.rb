require 'selenium-webdriver'
require 'faker'
caps = Selenium::WebDriver::Remote::Capabilities.chrome(:chrome_options => {detach: true})

$j = ARGV[0].to_i
$i=1

while $i < $j do
  begin
  driver=Selenium::WebDriver.for :chrome, desired_capabilities: caps
  driver1=Selenium::WebDriver.for :chrome, desired_capabilities: caps
  name = Faker::Name.first_name
  password = Faker::Internet.password

  driver1.get("https://tempail.com/ru/")

  mail = driver1.find_element(:id, "eposta_adres").attribute('value')

  sleep(3.0)

  driver.get("https://dev.by/registration")

  driver.find_element(:id, "user_username").send_keys(name)

  driver.find_element(:id, "user_email").send_keys(mail)

  driver.find_element(:id, "user_password").send_keys(password)

  driver.find_element(:id, "user_password_confirmation").send_keys(password)

  driver.find_element(:id, "user_agreement").click

  driver.find_element(:name, "commit").click

  sleep(2.0)

  driver.quit

  sleep(12.0)

  driver1.find_element(:class, "fa-reload").click

  sleep(2.0)

  driver1.find_elements(:class, "zaman")[1].click

  sleep(1.0)

  element = driver1.find_element(:id, 'iframe')
  driver1.switch_to.frame element
  driver1.find_element(:xpath, "/html/body/p[3]/a").click

  sleep(2.0)
  driver1.quit

  puts ("login - " + name + ", password - " + password)
  $i +=1

  rescue
    puts ("login - " + name + ", password - " + password + ": Fail registration")
  end
end