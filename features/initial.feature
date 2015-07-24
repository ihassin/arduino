Feature:
  Assure board led is responsive (needs arduino_firmata loaded on the board)

  Background:
    Given the board is connected

  Scenario: Turn led on
    When I issue the led "On" command
    Then the led is "On"

  Scenario: Turn led off
    When I issue the led "Off" command
    Then the led is "Off"
