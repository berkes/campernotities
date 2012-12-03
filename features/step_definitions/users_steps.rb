Given /^I am not logged in$/ do
  visit destroy_admin_user_session_path
end

When /^I log in with username "(.*?)" and password "(.*?)"$/ do |username, password|
  pending
end

When /^I create a new user with role "(.*?)"$/ do |role|
  visit admin_new_user_path
  click_link "new user"
  fill_in "Name", :with => "Harry"
  fill_in "Email", :with => "h.potter@hogwards.edu.uk"
  select  "Writer", :from => "Role"
  click_button "Save"
end

Then /^A new account is activated$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should see a login\-form$/ do
  page.should have_content("Login")
end

