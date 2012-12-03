When /^I visit the administration dashboard$/ do
  visit "/admin"
end

Then /^I should see a dashboard$/ do
  page.should have_content("Dashboard")
end

Then /^I should see a panel titled "(.*?)"$/ do |title|
  page.find('.panel h3').should have_content title
end
