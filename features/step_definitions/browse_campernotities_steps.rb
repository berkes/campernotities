﻿Given /^A Camping$/ do
  FactoryGirl.create(:camping)
end

Given /^(\d+) Campings$/ do |amount|
  amount.to_i.times do
    step "A Camping"
  end
end

Given /^a camping named "(.*?)"$/ do |name|
  FactoryGirl.create(:camping, :name => name)
end

Given /^a camping( named "(.*?)")? with the following labels:$/ do |is_named, name, label_table|
  labels = []
  label_table.hashes.each do |row|
    row['value'] = '' if row['value'] == 'nil'
    labels << FactoryGirl.create(:label, :name => row['name'], :value => row['value'])
  end
  params = {:labels => labels}
  params[:name] = name if is_named
  FactoryGirl.create(:camping, params)
end

Given /^"(.*?)" have (\d+) campings$/ do |name, amount|
  author = FactoryGirl.create(:author, :name => name)
  FactoryGirl.create_list(:camping_with_images, amount.to_i, :author => author)
end

When /^I (?:visit|am on) the homepage$/ do
  visit root_path
end

When /^I am on the Authors page$/ do
  visit authors_path
end

When /^I visit the camping listing for "(.*)"$/ do |username|
  user = AdminUser.find_by_name(username)
  user.should_not be_nil

  visit author_url(user)
end

When /^I visit the camping page$/ do
  visit camping_path the_camping
end

When /^I follow the "(.*?)" link$/ do |action|
  click_link action
end

When /^I follow the "(.*)" menu-link$/ do |action|
  find(".top-bar").click_link(action)
end

When /^I click the 'Show me campings by' dropdown$/ do
  find("#fp-selector .button.dropdown").click
end

When /^I click the logo in the top\-menu$/ do
  find_link("ShareShire").click
end

Then /^I should be on the homepage$/ do
  current_path.should == root_path
end

Then /^I should see "(.*?)" in the dropdown$/ do |name|
  find(".button.dropdown > ul").should be_visible
  within(".button.dropdown > ul") do
    have_link(name)
  end
end

Then /^I should see a camping "(.*?)"$/ do |name|
  page.should have_content name
end

Then /^I should see camping "(.*?)"$/ do |title|
  page.should have_content(title)
end

Then /^I should see between one and (\d+) thumbnails for each camping$/ do |upper|
  min_found = upper.to_i
  max_found = 0
  page.all("article").each do |article|
    images = article.all("a.th img").count
    min_found = [images, min_found].min
    max_found = [images, max_found].max
  end

  min_found.should be > 0
  max_found.should be <= upper.to_i
end

Then /^I should see all images as large image$/ do
  expected_image_paths = the_camping.images.map {|i| i.image.url(:large) }
  found_image_paths    = page.all("article img.large").map {|i| i[:src] }

  expected_image_paths.should eq found_image_paths

  #Determine if we actually have the images.
  found_image_paths.each do |path|
    get(path).status.should be 200
  end
end

Then /^I should see only the camping "(.*?)"$/ do |title|
  page.find("article h1").should have_content(title)
  page.all(:xpath, "//article/h1").count.should be 1
end

Then /^I should see the top (\d+) Campings$/ do |number|
  asserted_links = Camping.top(number).map {|c| camping_path(c) }
  all("article h1 a").map{|a| a[:href] }.should eq asserted_links
end

Then /^I should see thumbnails for the "(.*)" most recent campings for the User$/ do |number|
  assert_selector(:xpath, "//section/h2", :text => the_user.name)
  assert_selector("a.th img", :count => number)

  found_links = all("a.th").map {|a| a[:href] }

  asserted_links = the_user.campings.limit(number).map {|c| camping_path(c) }
  found_links.should eq asserted_links
end

Then /^I should see the description "(.*?)"$/ do |description|
  page.find(".description").should have_content(description)
end

Then /^I should see no markup$/ do
  page.should_not have_selector(:xpath, "//*[@class='description']/p/*")
end

Then /^I should see breaks and paragraphs$/ do
  page.all(".description>p").length.should eq 2
  page.should have_selector(".description>p>br")
end

Then /^I should see complex HTML$/ do
  %w{h1 h2 h3 p br strong em a img ul li blockquote}.each do |tag|
    page.should have_selector(".description #{tag}")
  end
end

Then /^I should see a link to "(.*?)"$/ do |link_title|
  page.should have_link(link_title)
end

Then /^it should link to the search page, centered at "(.*?)", "(.*?)"$/ do |latitude, longitude|
  location = CGI.escape("#{BigDecimal.new(latitude.to_f,10)},#{BigDecimal.new(longitude.to_f,10)}")
<<<<<<< Updated upstream

=======
>>>>>>> Stashed changes
  page.find('a.map')[:href].should eq "/maps?center=#{location}"
end

Then /^I should see a link named "(.*?)" to "(.*?)"$/ do |name, link|
  page.should have_link(name, :href => link)
end

Then /^I should see my name in the menu$/ do
  page.find(".top-bar").should have_content(the_user.name)
end

Then /^I should see a list of writers containing "(.*)"$/ do |writer|
  page.find(:xpath, "//section/h2").should have_content(writer)
end

Then /^I should see a table with a the following label properties:$/ do |table|
  within 'table.properties' do
    table.hashes.each do |label|
      should have_content label['name']
      should have_content label['value'] unless label['value'].nil?
    end
  end
end
