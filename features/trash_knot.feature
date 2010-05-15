Feature: Trash Knots
  As a user
  I want to delete knots
  so that I don't keep trash around
  
Scenario: Signed in user trashing a knot
  Given I have signed in with "email@person.com/password"
  And I have a knot for "http://example.com" with title "Example"
  And I am on the knots page
  When I follow "Trash"
  Then I should be on the knots page
  And I should see a notice message
