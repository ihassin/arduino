class Driver
  def self.set_led_state state
    @state = state
  end

  def self.get_led_state
    @state
  end
end
