When /^I visit the administration dashboard$/ do
  visit "/admin"
end

When /^I visit the "(.*?)" administration page$/ do |menu|
  step "I visit the administration dashboard"
  click_link menu
end

Then /^I should see a dashboard$/ do
  page.should have_content("Dashboard")
end

Then /^I should see a panel titled "(.*?)"$/ do |title|
  page.find('.panel h3').should have_content title
end

Then /^I should see the "(.*?)"-link for "(.*?)"$/ do |action, name|
  camping = Camping.where(:name => name).first
  page.should have_xpath("//a[@href='#{edit_admin_camping_path(camping)}']")
end

