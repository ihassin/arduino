require 'driver'

describe "led functions" do
  before(:each) do
    @driver = Driver.new
  end

  it "turns the led on" do
    expect(@driver.set_led_state ON).to eq ON
  end

  it "turns the led off" do
    expect(@driver.set_led_state OFF).to eq OFF
  end

  it "blinks" do
    @driver.blink 3
  end

end
