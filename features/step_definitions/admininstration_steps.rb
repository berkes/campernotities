When /^I vist the administration dashboard$/ do
  visit "/admin"
end

Then /^I should see a dashboard$/ do
  page.should have_content("Dashboard")
end
