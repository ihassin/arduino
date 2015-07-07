require "rubygems"
require "arduino_firmata"

ON      = 1
OFF     = 0

LED_PIN = 13

module ArduinoFirmata
  class Arduino
    def my_digital_read(pin)
      raise ArgumentError, "invalid pin number (#{pin})" if pin.class != Fixnum or pin < 0
      (@digital_output_data[pin >> 3] >> (pin & 0x07)) & 0x01 > 0 ? 1 : 0
    end
  end
end

class Driver
  def initialize
    @arduino ||= ArduinoFirmata.connect
    @offline = false
  rescue
    @offline = true
  end

  def set_led_state state
    result = @arduino.digital_write(LED_PIN, state == ON ? true : false)
    result = state == 1 ? result : !result
  rescue Exception => ex
    puts "Arduino::set_led_state not available, simulating. #{ex.message}"
    @state = state
    true
  end

  def get_led_state
    read = @arduino.my_digital_read(LED_PIN)
  rescue Exception => ex
    puts "Arduino::get_led_state not available, simulating. #{ex.message}"
    @state
  end
end
