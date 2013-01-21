require 'spec_helper'

describe Camping do
  it { should belong_to(:author) }
  it { should validate_presence_of(:author) }
  it { should have_many(:images) }
  it { should accept_nested_attributes_for(:images) }

  it { should validate_presence_of(:images).with_message(/At least one image/) }

  describe "#top" do
    it "should return the 5 last campings" do
      FactoryGirl.create_list(:camping, 7)
      expected = Camping.order(:created_at).limit(5)
      Camping.top(5).should eq expected
    end
  end

  describe "#main_image" do
    it "should return a paperclip image" do
      image = FactoryGirl.create(:image)
      camping = FactoryGirl.create(:camping)
      camping.stub(:images).and_return [image]

      camping.main_image.should be_a_kind_of(Paperclip::Attachment)
    end
  end
end
