Given /^I have a knot for "([^\"]*)" with title "([^\"]*)"$/ do |url, title|
  When "I go to the new knot page"
  And "I fill in \"URL\" with \"#{url}\""
  And "I fill in \"Title\" with \"#{title}\""
  And "I press \"Create\""
end

Given /^there is a knot for "([^\"]*)"$/ do |url|
  Given "I have signed in with \"user@example.com/password\""
  When "I go to the new knot page"
  And "I fill in \"URL\" with \"http://example.com\""
  And "I fill in \"Title\" with \"Example\""
  And "I press \"Create\""
  And "I sign out"
end

Given /^I already read the knot for "([^\"]*)"$/ do |url|
  knot = Knot.find_by_url(url)
  knot.state = "read"
  knot.save
end