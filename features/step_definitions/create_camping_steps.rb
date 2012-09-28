Given /^no campings on the campings listing$/ do
  Camping.find(:all).each {|c| c.destroy}
end

When /^I create a Camping named "(.*?)"$/ do |name|
  visit campings_path
  click_link "Add Camping"
  fill_in "Name", :with => name
  click_button "Save"
end

Then /^the "(.*?)" camping should appear on the campings listing$/ do |name|
  visit campings_path
  page.should have_content("1 camping")
  page.should have_content(name)
end

