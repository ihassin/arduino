require 'driver'

Given(/^the board is connected$/) do
  @driver ||= Driver.new
end

When(/^I issue the led "([^"]*)" command$/) do |command|
  case command
    when 'on'
      value = ON
    when 'off'
      value = OFF
  end
  expect(@driver.set_led_state value).to be true
end

Then(/^the led is "([^"]*)"$/) do |state|
  case state
    when 'on'
      my_state = ON
    when 'off'
      my_state = OFF
  end
  expect(@driver.get_led_state).to eq my_state
end
