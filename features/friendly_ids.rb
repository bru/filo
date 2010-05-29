Feature: Friendly User slugs
  As a User
  I want to see my name in the URL
  so to don't have to bother about system internals
  
  Scenario: User visiting his settings via slug
    Given I have signed in with "email@person.com/password"
    When I go to "/users/email-at-example-dot-com/edit"
    Then I should be on the settings page for "email@person.com"
    