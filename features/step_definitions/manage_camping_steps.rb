Given /^no campings on the campings listing$/ do
  Camping.find(:all).each {|c| c.destroy}
end

When /^I visit the 'create new camping' form$/ do
  visit admin_dashboard_path
  click_link "Campings"
  click_link "New Camping"
end

Given /^User has a camping with name "(.*?)"$/ do |name|
  FactoryGirl.create(:camping, :author => the_user)
end

Given /^User has a camping with a description "(.*?)"$/ do |description|
  FactoryGirl.create(:camping, :description => description, :author => the_user)
end

Given /^Another user has a camping with name "(.*?)"$/ do |name|
  author = FactoryGirl.create(:admin_user, :name => "Hermoine")
  FactoryGirl.create(:camping, :author => author, :name => name)
end

Given /^the User has "(\d*)" Campings$/ do |number|
  number.to_i.times do |i|
    FactoryGirl.create(:camping, :name => "Camping number #{i}", :author => the_user)
  end
end

When /^I (?:create|have) a camping "(.*?)"$/ do |name|
  FactoryGirl.create(:camping, :name => name, :author => the_user)
end

When /^I create a camping with the image "(.*?)"$/ do |image|
  FactoryGirl.create(:camping, :image => File.open(File.join("spec", "fixtures", image)))
end

When /^I attach the image "(.*?)"$/ do |image|
  page.attach_file("camping_image", File.join("spec", "fixtures", image))
end

When /^I visit the update page for "(.*?)"$/ do |name|
  camping = Camping.where(:name => name).first
  visit edit_admin_camping_path camping
end

When /^I click "(.*)"$/ do |name|
  click_button name
end

When /^I update the name to "(.*?)"$/ do |name|
  fill_in :camping_name, :with => name
  step %{I click "Update Camping"}
end

When /^I delete the image$/ do
  click_link "Delete image"
end

Then /^I can attach new images$/ do
  click_link "Add New Image"
  click_link "Add New Image"

  page.should have_selector("fieldset.has_many_fields input[type=file]", :count => 2)
end
