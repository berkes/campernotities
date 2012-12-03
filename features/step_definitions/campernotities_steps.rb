Given /^a Camping in a list$/ do
  @camping = Camping.new
end

When /^I set the description to "(.*?)"$/ do |description|
  @camping.update_attribute(:description, description)
end

Then /^the short description should be "(.*?)"$/ do |description|
  @camping.short_description.should == description
end

Then /^the "(.*?)" camping should appear on the campings listing$/ do |name|
  visit campings_path
  page.should have_content("1 camping")
  page.should have_content(name)
end

