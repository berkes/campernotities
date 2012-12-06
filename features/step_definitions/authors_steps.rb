Given /^there is an author "(.*?)"$/ do |name|
  AdminUser.new(
    :name  => name,
    :email => "harry.potter@hogwards.edu.uk",
    :password => "password", :password_confirmation => "password"
  ).save!
end

When /^I visit the profile for "(.*?)"$/ do |name|
  @author = AdminUser.where(:name => name).first
  visit author_path @author
end

Then /^I should see the title "(.*?)"$/ do |title|
  page.find("h1.title").should have_content(title)
end
