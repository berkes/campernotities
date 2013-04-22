Then /^I should see "(.*?)" in the title$/ do |title|
  first("title").native.text.should match /#{title}/
end

Then /^I should see "(.*)" in the titles$/ do |title|
  first("title").native.text.should match /#{title}/
  find("h1.title").should have_text title
end

Then /^I should see "(.*?)" as home\-link$/ do |title|
  find("nav.top-bar .name h1").should have_link title
end

