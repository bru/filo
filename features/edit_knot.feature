Feature: Edit Knot
  As a user
  I want to edit a knot
  so that I can amend details or add notes
  
  Scenario: Signed in user editing a knot
    Given I have signed in with "email@person.com/password"
    And I have a knot for "http://example.com" with title "Example"
    When I go to the edit knot page for "http://example.com"
    Then I should be on the edit knot page for "http://example.com"

    When I fill in "URL" with "http://example.com"
    And I fill in "Title" with "Knot Edit"
    And I press "Update"
    Then I should be on the knots page
    And I should see "Knot Edit"
    And I should see a notice message
    
  Scenario: Signed out user trying to edit a knot
    Given I am not signed in
    And there is a knot for "http://example.com"
    When I go to the edit knot page for "http://example.com"
    Then I should be on the sign in page
    
  Scenario: Signed in user trying to edit another user's knot
    Given I have signed in with "email@person.com/password"
    And I have a knot for "http://example.com" with title "Example"
    And I sign out
    And I have signed in with "evil@person.com/password"
    When I go to the edit knot page for "http://example.com"
    Then I should be on the sign in page
    And I should see a failure message 