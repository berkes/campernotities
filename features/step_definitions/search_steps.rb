When /^I fill in search with "(.*?)"$/ do |keyword|
  fill_in :search_contains, :with => keyword
end

When /^I uncollapse "Refine"$/ do
  find(:xpath, %{//fieldset[@class="collapsible collapsed"]/legend[contains(text(), "Refine")]}).click()
end

When /^I check "(.*?)" search filter$/ do |filter|
  within ".filters .flags" do
    check filter
  end
end

When /^I select "(.*?)" from "(.*?)"$/ do |selection, selectfield|
  within ".filters .selects" do
    select(selection, :from => selectfield)
  end
end

Then /^"(.*?)" should be checked$/ do |filter|
  within ".filters .flags" do
    should have_checked_field(filter)
  end
end

Then /^in "(.*?)", "(.*?)" should be selected$/ do |selectfield, selection|
  within ".filters .selects" do
    should have_select(selectfield, :selected => selection)
  end
end
