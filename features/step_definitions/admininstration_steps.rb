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

Then /^I should see the image "(.*?)" on the admin view page$/ do |image|
  camping = Camping.find(:first)
  visit admin_camping_path(camping)

  camping.image.url.should match /#{image}/
  page.should have_xpath("//img[@src='#{camping.image.url}']")
end
