Given /^I have a camping "(.*?)"$/ do |title|
  step "I create a Camping named \"#{title}\""
end

Given /^no campings on the campings listing$/ do
  Camping.find(:all).each {|c| c.destroy}
end

When /^I create a Camping named "(.*?)"$/ do |name|
  visit admin_dashboard_path
  click_link "Campings"
  click_link "New Camping"
  fill_in "Name", :with => name
  click_button "Create Camping"
end

When /^the writer clicks update$/ do
  visit my_campings_path
  click_link "Update"
end

When /^updates the camping title to "(.*?)"$/ do |arg1|
  fill_in "Name", :with => name
  click_button "Update"
end

