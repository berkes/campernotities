Then /^I should see "(.*?)" in the title$/ do |title|
  first("title").native.text.should match /.*#{title}$/
end

Then /^I should see "(.*?)" as home\-link$/ do |title|
  find("nav.top-bar .name h1").should have_link title
end

