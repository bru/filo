Feature: Public Profile 
As a user 
I want to see other users' profiles
so that I can consider their reads

Scenario: user setting her profile as public
  Given I have signed in with "email@person.com/password"
  When I go to the settings page for "email@person.com"
  And I choose "Yes!"
  And I press "Save"
  Then I should be on the profile page for "email@person.com"
  And I should see an alert message
  When I choose "Yes!"
  And I fill in "Nickname" with "person1"
  And I press "Save"
  Then I should be on the knots page
  And I should see a notice message
  
Scenario: user viewing another user's public profile
  Given I have signed in with "email@person.com/password"
  And another user exists with email: "email2@person.com", nickname: "person2", public_flag: true
  When I go to the profile page for "email2@person.com"
  Then I should be on the profile page for "email2@person.com"

Scenario: user viewing another user's private profile
  Given I have signed in with "email@person.com/password"
  And a user exists with email: "email2@person.com", nickname: "person2", public_flag: "false"
  When I go to the profile page for "email2@person.com"
  Then I should be on the knots page
  And I should see an alert message
  
  