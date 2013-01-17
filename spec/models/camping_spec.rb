require 'spec_helper'

describe Camping do
  it { should belong_to(:author) }
  it { should validate_presence_of(:author) }
  it { should have_many(:images) }
  it { should accept_nested_attributes_for(:images) }

  describe "#top" do
    it "should return the 5 last campings" do
      FactoryGirl.create_list(:camping, 7)
      expected = Camping.order(:created_at).limit(5)
      Camping.top(5).should eq expected
    end
  end
end
