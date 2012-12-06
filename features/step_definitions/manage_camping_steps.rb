Given /^I have a camping "(.*?)"$/ do |title|
  step "I create a Camping named \"#{title}\""
end

Given /^no campings on the campings listing$/ do
  Camping.find(:all).each {|c| c.destroy}
end

Given /^a 'create new camping' form$/ do
  visit admin_dashboard_path
  click_link "Campings"
  click_link "New Camping"
end

When /^I create a Camping named "(.*?)"$/ do |name|
  step "a 'create new camping' form"
  fill_in "Name", :with => name
  click_button "Create Camping"
end

When /^I attach an image/ do
  page.attach_file("Image", File.join("spec", "fixtures", "green_small.jpg"))
end

When /^I visit the update page for "(.*?)"$/ do |name|
  @camping = Camping.where(:name => name).first
  visit edit_admin_camping_path @camping
end

When /^I update the name to "(.*?)"$/ do |name|
  fill_in :name, :with => name
  click_button :update
end
