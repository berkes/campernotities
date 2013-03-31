require 'spec_helper'

describe Label do
  it { should belong_to(:camping) }
  it { should validate_presence_of(:name) }
  it { should ensure_length_of(:name).is_at_least(2).is_at_most(60) }

  context "#top" do
    it "should return unique names" do
      FactoryGirl.create_list(:label, 2, :name => "Dogs Allowed", :value => nil)
      Label.top(10).length.should be 1
    end
    it "should return only the ten most used labels" do
      (1..11).to_a.each do |i|
        FactoryGirl.create_list(:label, i, :name => "Label-#{i}", :value => nil)
      end
      top = Label.top(10)
      top.length.should be <= 10
      top.first.name.should eq "Label-11"

      top.map{|l| l.name}.should_not include "Label-1"
    end
  end

  context "#values" do
    it "should return only labels with values" do
      flag   = FactoryGirl.create(:label, :name => "Dogs Allowed", :value => nil)
      select = FactoryGirl.create(:label, :name => "Amount of places", :value => "10-20")

      Label.values.should include(select)
      Label.values.should_not include(flag)
    end
  end
end
