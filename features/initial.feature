Feature:
  Assure board led is responsive

  Background:
    Given the board is connected

  Scenario: Turn led on
    When I issue the led "on" command
    Then the led is "on"

  Scenario: Turn led off
    When I issue the led "off" command
    Then the led is "off"
