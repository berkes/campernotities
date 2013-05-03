require 'spec_helper'

describe Camping do
  it { should belong_to(:author) }
  it { should validate_presence_of(:author) }

  it { should have_many(:labels) }
  it { should accept_nested_attributes_for(:labels) }
  it { should allow_mass_assignment_of(:labels_attributes) }

  it { should have_many(:images) }
  it { should accept_nested_attributes_for(:images) }

  context "without images" do
    it "should be invalid" do
      camping = Camping.new()
      camping.images = []
      camping.should be_invalid
      camping.should have(1).errors_on(:base)
    end
  end
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

  describe "geocoder" do
    before(:each) do
      @camping = FactoryGirl.create(:camping)
    end

    describe "#latitude" do
      it "should require longitude when provided" do
        @camping.latitude = 5.9757149
        @camping.longitude = ''
        @camping.should_not be_valid
      end

      it "should be between -90 and 90" do
        @camping.longitude = 10
        @camping.latitude = -91
        @camping.should_not be_valid
        @camping.latitude = 91
        @camping.should_not be_valid
      end
    end

    describe "#longitude" do
      it "should require latitude when provided" do
        @camping.longitude = 51.77802459999999
        @camping.latitude = ''
        @camping.should_not be_valid

        @camping.longitude = 0
        @camping.latitude = ''
        @camping.should_not be_valid
      end

      it "should be between -180 and 180" do
        @camping.latitude = 10
        @camping.longitude = -181
        @camping.should_not be_valid
        @camping.longitude = 181
        @camping.should_not be_valid
      end
    end

    it { should validate_numericality_of(:latitude) }
    it { should validate_numericality_of(:longitude) }

    it "should allow 0,0 as valid point" do
      @camping.latitude = 0
      @camping.longitude = 0
      @camping.should be_valid
    end
    it "should be valid when both latitude and longitude are provided" do
      @camping.longitude = 51.77802459999999
      @camping.latitude = 5.9757149
      @camping.should be_valid
    end

    it "should be valid when neither latitude nor longitude are provided" do
      @camping.longitude = ""
      @camping.latitude = ""
      @camping.should be_valid
    end
  end

  describe "#website" do
    it { should allow_mass_assignment_of(:website) }
    it { should allow_value(nil).for(:website) }

    it 'should ensure website has a length of at most 255' do
      camping = Camping.new(:website => "x" * 256)
      camping.valid?
      camping.errors[:website].first.should match /is too long/
    end
    it 'should prepend http to urls without it' do
      camping = Camping.new(:website => "example.com")
      camping.valid?
      camping.website.should eq "http://example.com"
    end
    %w{example.com http://example.com https://example.com}.each do |valid_value|
      it { should allow_value(valid_value).for(:website) }
    end
  end
end
