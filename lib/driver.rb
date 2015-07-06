require 'arduino'

LED_PIN=13

class Driver
  def self.set_led_state state
    @arduino ||= Arduino::new('/dev/tty.Bluetooth-Modem')
  rescue
    puts "Arduino::set_led_state not available, simulating"
    @state = state
  end

  def self.get_led_state
    return @arduino.isHigh?(LED_PIN)
  rescue
    puts "Arduino::get_led_state not available, simulating"
    @state
  end
end
