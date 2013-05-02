Given /^no campings on the campings listing$/ do
  Camping.find(:all).each {|c| c.destroy}
end

Given /^a camping with the following parameters:$/ do |table|
  FactoryGirl.create(:camping, table.rows_hash)
end

Given /^I have a Camping with a description with (no|simple|complex) markup$/ do |markup|
  description = File.open(Rails.root.join("spec", "fixtures", "description_#{markup}.markdown")).read
  FactoryGirl.create(:camping, :description => description)
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

When /^I (?:create|have) a camping with the image "(.*?)"$/ do |image|
  image = FactoryGirl.create(:image, :image => File.open(File.join("spec", "fixtures", "images", image)))
  camping = FactoryGirl.create(:camping, :images => [image])
end

When /^I update the image to "(.*?)"$/ do |image|
  page.attach_file("camping_images_attributes_0_image", File.join("spec", "fixtures", "images", image))
end

When /^I update the name to "(.*?)"$/ do |name|
  fill_in :camping_name, :with => name
  step %{I click "Update Camping"}
end

When /^I mark the image for removal$/ do
  check "Remove image"
end

When /^I create a label "([^"]*)"$/ do |name|
  click_link "Add New Label"
  within(".labels") do
    fill_in "Name", :with => name
  end
end

When /^I create a label "([^"]*)" with "([^"]*)"$/ do |name, value|
  click_link "Add New Label"
  within(".labels") do
    fill_in "Name", :with => name
    fill_in "Value", :with => value
  end
end

Then /^I can attach new images$/ do
  click_link "Add New Image"
  click_link "Add New Image"

  page.should have_selector("fieldset.has_many_fields input[type=file]", :count => 2)
end

Then /^I should see an error telling "(.*?)"$/ do |error|
  page.find(".errors").should have_content(error)
end

Then /^the form should have no errors$/ do
  page.should_not have_selector("ul.errors")
end
