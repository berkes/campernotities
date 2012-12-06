Given /^there is a camping with name "(.*?)"$/ do |name|
  author = AdminUser.new(:name => "Harry", :email => "admin@example.com", :password => "password", :password_confirmation => "password")
  author.save!
  @camping = Camping.new(:name => name)
  @camping.author = author
  @camping.save!
end

Given /^with a description "(.*?)"$/ do |description|
  @camping.update_attribute(:description, description)
end

When /^I visit the camping listing$/ do
  visit campings_path
end

When /^I follow the "(.*?)" link$/ do |action|
  click_link action
end

Then /^I should see a camping "(.*?)"$/ do |name|
  page.should have_content name
end

Then /^I should see camping "(.*?)"$/ do |title|
  page.should have_content(title)
end

Then /^I should see the description "(.*?)"$/ do |description|
  page.find(".description").should have_content(description)
end

Then /^I should see a link to "(.*?)"$/ do |link_title|
  page.should have_link(link_title)
end
