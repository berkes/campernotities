When /^I visit the homepage$/ do
  visit root_url
end

When /^I visit the camping listing for "(.*)"$/ do |username|
  user = AdminUser.find_by_name(username)
  user.should_not be_nil

  visit author_path(user)
end

When /^I follow the "(.*?)" link$/ do |action|
  click_link action
end

When /^I click the 'Show me campings by' dropdown$/ do
  find("#fp-selector .button.dropdown").click
end

When /^I select "(.*?)" from the dropdown$/ do |name|
  find(".button.dropdown a", :text => name).should be_visible
  find(".button.dropdown").click_link(name)
end

When /^I click the logo in the top\-menu$/ do
  find(".top-bar .name h1 a").click
end

Then /^I should be on the homepage$/ do
  current_path.should == root_path
end

Then /^I should see a camping "(.*?)"$/ do |name|
  page.should have_content name
end

Then /^I should see camping "(.*?)"$/ do |title|
  page.should have_content(title)
end

Then /^I should see only the camping "(.*?)"$/ do |title|
  page.assert_selector(:xpath, "//article/h1", :count => 1)
  page.should have_content(title)
end

Then /^I should see the description "(.*?)"$/ do |description|
  page.find(".description").should have_content(description)
end

Then /^I should see a link to "(.*?)"$/ do |link_title|
  page.should have_link(link_title)
end
