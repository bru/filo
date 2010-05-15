Feature: Manage knots
  As a User
  I want to be manage my knot list
  so that I can consume or postpone reading
  
  Background:
    Given I have signed in with "email@person.com/password"
    And I have a knot for "http://example.com" with title "Example"
    And I have a knot for "http://example2.com" with title "Example 2"

  Scenario: User viewing her knots
    When I go to the knots page
    Then I should see "Example"
    Then I should see "Example 2"
  
  Scenario: User reading a knot
  
  Scenario: User skipping a knot
  
  Scenario: User loving a knot
   
