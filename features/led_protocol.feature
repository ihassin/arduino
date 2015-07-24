Feature: Control the Arduino LED using a protocol

  Scenario: Use protocol: STX-CMD-PIN-ETX
    STX - 0x02
    CMD - 0 OFF, 1 ON
    PIN - 13
    ETX - 0x03

    Given the board is present
    When I turn the LED "on"
    Then the LED is "on"
