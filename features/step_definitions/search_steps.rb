When /^I check "(.*?)" search filter$/ do |filter|
  within ".filters" do
    check filter
  end
end

When /^I select "(.*?)" from "(.*?)"$/ do |selection, selectfield|
  within ".filters .selects" do
    select(selection, :from => selectfield)
  end
end
