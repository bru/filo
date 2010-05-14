Given /^I am not signed in$/ do
  # do nothing
end

When /^I follow the delete user link for user with email "(.*)"$/ do |email|
  user = User.find_by_email(email)
  visit delete_user_path(:id => user.id)
end