Feature: Add Knot
  As a User
  I want to be able to add a knot
  so that I'll read it later
  
  Scenario: Signed in user adding a knot
    Given I have signed in with "email@person.com/password"
    When I go to the new knot page
    Then I should be on the new knot page

    When I fill in "URL" with "http://example.com"
    And I fill in "Title" with "Example"
    And I fill in "Summary" with "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
    And I press "Create"
    Then I should be on the knots page
    And I should see "Example"
    And I should see a notice message
    
  Scenario: Signed out user trying to add a knot
    Given I am not signed in
    When I go to the new knot page
    Then I should be on the sign in page
