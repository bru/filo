Given /^I have a knot for "(.*)"$/ do |url|
  Given "I have signed in with \"user@example.com/password\""
  When "I go to the new knot page"
  And "I fill in \"URL\" with \"http://example.com\""
  And "I fill in \"Title\" with \"Example\""
  And "I press \"Create\""
end

Given /^there is a knot for "(.*)"$/ do |url|
  Given "I have signed in with \"user@example.com/password\""
  When "I go to the new knot page"
  And "I fill in \"URL\" with \"http://example.com\""
  And "I fill in \"Title\" with \"Example\""
  And "I press \"Create\""
  And "I sign out"
end