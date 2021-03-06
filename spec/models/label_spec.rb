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

  context "scopes for search" do
    before do
      @flag   = FactoryGirl.create(:label, :name => "Dogs Allowed", :value => '')
      @select = FactoryGirl.create(:label, :name => "Amount of places", :value => "10-20")
    end

    context "#flags" do
      it "should return only labels without values" do
        Label.flags.should include(@flag)
        Label.flags.should_not include(@select)
      end
    end

    context "#selects" do
      it "should return only labels with values" do
        Label.selects.should include(@select)
        Label.selects.should_not include(@flag)
      end
    end
  end
      

  context "#options" do
    before do
      FactoryGirl.create(:label, :name => "Amount of places", :value => "10-20")
      FactoryGirl.create(:label, :name => "Amount of places", :value => "20-50")

      @label = Label.find_by_name("Amount of places")
    end

    it "should group all values" do
      @label.options.should =~ ["20-50", "10-20"]
    end

    it "should have only uniqe values" do
      FactoryGirl.create(:label, :name => "Amount of places", :value => "20-50")
      @label.options.length.should == 2
    end

    it "should be sorted" do
      FactoryGirl.create(:label, :name => "Amount of places", :value => "0-10")
      @label.options[0].should eq "0-10"
    end
  end
end
