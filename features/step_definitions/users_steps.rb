Given /^I am not logged in$/ do
  visit destroy_admin_user_session_path
end

Given /^there is a user "(.*?)" with password "(.*?)"$/ do |username, password|
  @user = AdminUser.new(:email => username, :password => password, :password_confirmation => password)
  @user.save!
end

When /^I log in with username "(.*?)" and password "(.*?)"$/ do |username, password|
  visit new_admin_user_session_path
  fill_in "Email", :with => username
  fill_in "Password", :with => password
  click_button "Login"
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

