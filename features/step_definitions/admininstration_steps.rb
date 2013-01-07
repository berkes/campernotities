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
  if action == "edit"
    action_path = polymorphic_path([action.to_sym, :admin, camping])
  else
    action_path = polymorphic_path([:admin, camping])
  end
  page.should have_xpath("//a[@href='#{action_path}']")
end

Then /^I should see the image "(.*?)" on the attributes page$/ do |image|
  page.should have_xpath("//img[contains(@src, '#{image}')]")
end

Then /^I should not see the image in attributes on the attributes page$/ do
  page.should_not have_xpath('//*[@class="attributes_table camping"]//img')
end
