include FeatureHelper

Given /^I am not logged in$/ do
  visit destroy_admin_user_session_path
end

Given /^I have logged in as an Administrator$/ do
  email    = "admin@example.com"
  password = "password"
  user(:email => email, :password => password, :password_confirmation => password)
  step %{I log in with username "#{email}" and password "#{password}"}
end

Given /^there is a user "(.*?)" with password "(.*?)"$/ do |email, password|
  user(:email => email, :password => password, :password_confirmation => password)
end

Given /^there is a user with name "(.*?)"$/ do |username|
  user(:name => username)
end

When /^I log in with username "(.*?)" and password "(.*?)"$/ do |username, password|
  visit new_admin_user_session_path
  fill_in "Email", :with => username
  fill_in "Password", :with => password
  click_button "Login"
end

Then /^I should see a login\-form$/ do
  page.should have_content("Login")
end
