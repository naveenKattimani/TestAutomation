Feature: Nordstromrack login

  Scenario: Sign in and sign out
    Given I open nordstromrack website
    When I sign in "Automation@gmail.com" and "Password1"
	Then I see homepage
    Then I sign out
