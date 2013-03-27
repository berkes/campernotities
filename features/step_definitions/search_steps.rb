When /^I check "(.*?)" search filter$/ do |filter|
  within ".filters" do
    check filter
  end
end
