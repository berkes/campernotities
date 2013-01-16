When /^I (?:visit|am on) the homepage$/ do
  visit root_path
end

When /^I am on the Authors page$/ do
  visit authors_path
end

When /^I visit the camping listing for "(.*)"$/ do |username|
  user = AdminUser.find_by_name(username)
  user.should_not be_nil

  visit author_url(user)
end

When /^I follow the "(.*?)" link$/ do |action|
  click_link action
end

When /^I follow the "(.*)" menu-link$/ do |action|
  find(".top-bar").click_link(action)
end

When /^I click the 'Show me campings by' dropdown$/ do
  find("#fp-selector .button.dropdown").click
end

When /^I click the logo in the top\-menu$/ do
  find(".top-bar .name h1 a").click
end

Then /^I should be on the homepage$/ do
  current_path.should == root_path
end

Then /^I should see "(.*?)" in the dropdown$/ do |name|
  find(".button.dropdown > ul").should be_visible
  within(".button.dropdown > ul") do
    have_link(name)
  end
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

Then /^I should see the "(.*)" most recent campings by the User$/ do |number|
  found_links = []
  asserted_links = the_user.campings.limit(5).map {|c| camping_path(c) }

  within(:xpath, "//section[1]/h2", :text => the_user.name) do
    assert_selector(:xpath, "//ul/li/a/img", :count => 5)
    found_links = all(:xpath, "//ul/li/a").map {|a| a.attributes[:href]}
  end

  links.should eq asserted_links
end

Then /^I should see the description "(.*?)"$/ do |description|
  page.find(".description").should have_content(description)
end

Then /^I should see a link to "(.*?)"$/ do |link_title|
  page.should have_link(link_title)
end

Then /^I should see a list of writers containing "(.*)"$/ do |writer|
  page.find(:xpath, "//section/h2").should have_content(writer)
end
