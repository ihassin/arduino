require 'board'
require 'driver'

Given(/^the board is connected$/) do
  @board ||= Ita::Board.new
end

When(/^I issue the led "([^"]*)" command$/) do |command|
  case command
    when 'on'
      @board.led = ON
    when 'off'
      @board.led = OFF
    when 'blink'
      @board.led = BLINK
  end
  Driver.set_led_state @board.led
end

Then(/^the led is "([^"]*)"$/) do |state|
  case state
    when 'on'
      my_state = ON
    when 'off'
      my_state = OFF
    when 'blinking', 'blink'
      my_state = BLINKING
  end
  expect(my_state).to eq @board.led
  expect(Driver.get_led_state).to eq my_state
end
