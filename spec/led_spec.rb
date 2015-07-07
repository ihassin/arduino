require 'driver'

describe "simulator functions" do
  before(:each) do
    @driver = Driver.new
  end

  it "turns the led on" do
    expect(@driver.set_led_state ON).to be true
  end

  it "turns the led off" do
    expect(@driver.set_led_state OFF).to be true
  end

end