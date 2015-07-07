require "arduino_firmata"

ON      = 1
OFF     = 0

LED_PIN = 13

# Monkeypatch ArduinoFirmata to return status of the OUTPUT pins
module ArduinoFirmata
  class Arduino
    def output_digital_read(pin)
      raise ArgumentError, "invalid pin number (#{pin})" if pin.class != Fixnum or pin < 0
      (@digital_output_data[pin >> 3] >> (pin & 0x07)) & 0x01 > 0 ? ON : OFF
    end
  end
end

class Driver
  def initialize
    @arduino ||= ArduinoFirmata.connect nil, :bps => 57600
  rescue Exception => ex
    puts "Simulating. #{ex.message}" if @arduino.nil?
  end

  def set_led_state state
    result = @arduino.digital_write(LED_PIN, state)
  rescue Exception => ex
    @state = state
    state
  end

  def get_led_state
    @arduino.output_digital_read(LED_PIN)
  rescue Exception => ex
    @state
  end

  def blink num
    (0..num).each do
      set_led_state ON
      sleep 0.5
      set_led_state OFF
      sleep 0.5
    end
  end
end
