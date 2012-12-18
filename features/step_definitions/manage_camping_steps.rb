Given /^I have a camping "(.*?)"$/ do |title|
  step %{I create a camping "#{title}"}
end

Given /^no campings on the campings listing$/ do
  Camping.find(:all).each {|c| c.destroy}
end

Given /^a 'create new camping' form$/ do
  visit admin_dashboard_path
  click_link "Campings"
  click_link "New Camping"
end

When /^I create a camping "(.*?)"$/ do |name|
  step %{a 'create new camping' form}
  step %{I give it the name "#{name}"}
  step %{I click "Create Camping"}
end

When /^I create a camping with the image "(.*?)"$/ do |image|
  step %{a 'create new camping' form}
  step %{I give it the name "Beautifull Green"}
  step %{I attach the image "#{image}"}
  step %{I click "Create Camping"}
end

When /^I give it the name "(.*?)"$/ do |name|
  fill_in "Name", :with => name
end

When /^I attach the image "(.*?)"$/ do |image|
  page.attach_file("camping_image", File.join("spec", "fixtures", image))
end

When /^I visit the update page for "(.*?)"$/ do |name|
  @camping = Camping.where(:name => name).first
  visit edit_admin_camping_path @camping
end

When /^I click "(.*)"$/ do |name|
  click_button name
end

When /^I update the name to "(.*?)"$/ do |name|
  fill_in :name, :with => name
  step %{I click "Update Camping"}
end

When /^I delete the image$/ do
  click_link "Delete image"
end
