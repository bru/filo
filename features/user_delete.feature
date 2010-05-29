Feature: User delete
  In order to protect my privacy
  A user
  Should be able to delete her account
  
    Scenario: Signed in user deletes account
      Given I am signed up and confirmed as "email@person.com/password"
      When I sign in as "email@person.com/password"
      Then I should be signed in
      And I follow the delete user link for user with email "email@person.com"
      Then I should see "Are you sure?"
      And I press "Proceed"
      Then I should be signed out
      And I should see a notice message
      When I return next time
      Then I should be signed out