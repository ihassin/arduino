Feature:
  Echo strings from the Arduino

  Scenario: Echo
    Given the board is present
    When I send "hello world"
    Then the Arduino echoes it back
