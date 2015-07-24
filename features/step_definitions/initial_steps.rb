require 'driver'

Given(/^the board is connected$/) do
  @driver ||= Driver.new
end

When(/^I issue the led "([^"]*)" command$/) do |command|
  value = string_to_val command
  expect(@driver.set_led_state value).to be value
end

Then(/^the led is "([^"]*)"$/) do |state|
  expect(@driver.get_led_state).to eq string_to_val state
end

def string_to_val state
  case state.downcase
    when 'on'
      my_state = ON
    when 'off'
      my_state = OFF
  end
end
