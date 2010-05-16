Feature: Manage knots
  As a User
  I want to be manage my knot list
  so that I can consume or postpone reading
  
  Background:
    Given I have signed in with "email@person.com/password"
    And I have a knot for "http://example.com" with title "Example"

  Scenario: User viewing her knots
    Given I have a knot for "http://example2.com" with title "Example 2"
    When I go to the knots page
    Then I should see "Example"
    Then I should see "Example 2"
  
  Scenario: User reading a knot
    When I go to the knots page
    Then I should see "Example" within ".unread"
    When I follow "Example"
    When I go to the knots page
    Then I should see "Example" within ".read"
  
  Scenario: User skipping a knot
    When I go to the knots page
    And I follow "skip"
    Then I should be on the knots page
    And I should see a notice message
    And I should not see "Example" within ".unread"
    And I should see "Example" within ".read"
  
  Scenario: User replaying a knot
    Given I already read the knot for "http://example.com"
    When I go to the knots page
    Then I should see "Example" within ".read"
    When I follow "replay"
    Then I should be on the knots page
    And I should see a notice message
    And I should not see "Example" within ".read"
    And I should see "Example" within ".unread"
   
