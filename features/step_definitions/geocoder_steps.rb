Given /^a camping with latitude latitude "(.*?)" and longitude "(.*?)" exists$/ do |latitude, longitude|
  FactoryGirl.create(:camping, :latitude => latitude, :longitude => longitude)
end

Given /^(\d+) geocoded Campings$/ do |amount|
  amount.to_i.times do
    FactoryGirl.create(:camping_with_geo)
  end
end

When /^I fill in the form with latitude "(.*?)" and longitude "(.*?)"$/ do |latitude, longitude|
  fill_in :camping_latitude,     :with => latitude
  fill_in :camping_longitude,    :with => longitude
end

Then /^the camping should have a latitude and longitude$/ do
  the_camping.latitude.should_not be_nil
  the_camping.longitude.should_not be_nil
end

Then /^I should (not\s)?see a Google Map$/ do |toggle|
  if toggle
    page.should_not have_selector("img.map")
  else
    page.find("img.map")[:src].should match(/maps.googleapis.com/)
  end
end

Then /^I should see an interactive Google Map$/ do
  page.should have_selector("#map_canvas")
end

Then /^I should see the maps location at "(.*?)", "(.*?)"$/ do |latitude, longitude|
  location = "#{BigDecimal.new(latitude.to_f,10)},#{BigDecimal.new(longitude.to_f,10)}"
  page.find("img.map")[:src].should match /center=#{location}.*markers=#{location}/
end

Then /^I should (not\s)?see a table with a geo property$/ do |toggle|
  operator = (toggle ? :should_not : :should)
  page.send(operator, have_selector("table tr.geo"))
end

Then /^I should see all the campings on the map$/ do
  Camping.geocoded.top(50).each do |camping|
    page.should have_xpath "//script[contains(.,'map.addMarker(#{camping.latitude}, #{camping.longitude}, \"#{camping.name}\")')]"
  end
end
