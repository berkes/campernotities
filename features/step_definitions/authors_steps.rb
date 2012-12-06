Given /^there is an author "(.*?)"$/ do |name|
  @author = AdminUser.new(:name  => name)
end

When /^I visit the profile for "(.*?)"$/ do |arg1|
  
end
