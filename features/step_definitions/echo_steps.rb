STX = 'B'
ETX = 'E'

Given(/^the board is present$/) do
  begin
    @serial = SerialPort.new("/dev/tty.usbmodem1421", 57600, 8, 1, SerialPort::NONE)
    sleep 2
  rescue Exception => ex
    @serial = nil
  end
end

When(/^I send "([^"]*)"$/) do |cmd|
  @cmd = cmd
  begin
    sent = @serial.write STX + cmd + ETX + "\n"
    expect(sent).to eq (cmd.length + 1)
  rescue Exception => ex
  end
end

Then(/^the Arduino echoes it back$/) do
  begin
    line = @serial.readline.chomp
    expect(line).to eq @cmd
  rescue Exception => ex
  end
end

When(/^I turn the LED "([^"]*)"$/) do |cmd|
  @cmd = STX + "1" + "13" + ETX + "\n"
  begin
    sent = @serial.write @cmd
    expect(sent).to eq (cmd.length + 1)
  rescue Exception => ex
  end
end

Then(/^the LED is "([^"]*)"$/) do |cmd|
  begin
    line = @serial.readline.chomp
    expect(line).to eq @cmd.chomp
  rescue Exception => ex
  end
end

After do
  @serial.close if @serial
end
