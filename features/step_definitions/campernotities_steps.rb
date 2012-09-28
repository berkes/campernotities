Given /^a Camping in a list$/ do
  @camping = Camping.new
end

When /^I set the description to "(.*?)"$/ do |description|
  @camping.update_attribute(:description, description)
end

Then /^the short description should be "(.*?)"$/ do |description|
  @camping.short_description.should == description
end
