Feature: User edit settings
  As a user
  I want to be able to change my settings
  so that I can appreciate the site better
  
  Background: 
    Given I have signed in with "email@person.com/password"
    And I am on the settings page for "email@person.com"
    
  Scenario: user changing language
    When I select "Italiano" from "Language"
    And I press "Save"
    Then I should be on the knots page
    And I should see a notice message
    # When I go to the settings page for "email@person.com"
    # And I select "English" from "Language"
    # And I press "Save"
    # Then I should be on the knots page
    # And I should see "Hello"
    
  Scenario: user changing password
    When I fill in "Choose Password" with "test"
    And I fill in "Confirm Password" with "test"
    And I press "Save"
    Then I should be on the knots page
    And I should see a notice message
    
  Scenario: user changing Nickname
    When I fill in "Nickname" with "User"
    And I press "Save"
    Then I should be on the knots page
    And I should see a notice message
    
  Scenario: user making his reading list public
  