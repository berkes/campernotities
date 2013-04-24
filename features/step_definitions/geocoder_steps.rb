Given /^a camping with latitude latitude "(.*?)" and longitude "(.*?)" exists$/ do |latitude, longitude|
  FactoryGirl.create(:camping, :latitude => latitude, :longitude => longitude)
end

Given /^A Camping without a geocode$/ do
  FactoryGirl.create(:camping, :latitude => nil, :longitude => nil)
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

When /^I visit the map page$/ do
  visit maps_path({:test => true })
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
  #maps.js has this hardcoded:
  #var position = { coords: { latitude: '51.71154', longitude: '6.05034' }};
  page.evaluate_script('map.gmap.center.lat()').to_f.should be_within(1).of(51.0)
  page.evaluate_script('map.gmap.center.lng()').to_f.should be_within(1).of(6.0)
end

Then /^I should see the maps location at "(.*?)", "(.*?)"$/ do |latitude, longitude|
  location = "#{BigDecimal.new(latitude.to_f,10)},#{BigDecimal.new(longitude.to_f,10)}"
  page.find("img.map")[:src].should match /center=#{location}.*markers=#{location}/
end

Then /^I should (not\s)?see a table with a geo property$/ do |toggle|
  operator = (toggle ? :should_not : :should)
  page.send(operator, have_selector("table tr.geo"))
end

Then /^I should see all the campings$/ do
  save_page
  Camping.geocoded.top(50).each do |camping|
    step %Q{I should see camping "#{camping.name}"}
  end
end

Then /^it should ask me if I allow to share my current location$/ do
  page.should have_xpath "//script[contains(.,'map.setup()')]"
end

