require 'spec_helper'

describe MapsController do
  describe "GET 'index'" do
    before :all do
      @campings = FactoryGirl.create_list(:camping_with_geo, 5)
    end

    before do
      get :index
    end
    it { should assign_to(:title) }
    it { should respond_with(:success) }
    it { should assign_to(:pins).with(Camping.top(50).geocoded) }

    context "JSON" do
      before do
        get :index, :format => :json
      end
      it { should respond_with(:success) }
      it 'should have the pins as JSON' do
        response.body.should eq Camping.top(50).geocoded.to_json
      end
    end

    context "bounded" do
      before do
        get :index, :bounding => "51.332168,4.468309,52.350285,7.214891"
      end
      it { should respond_with(:success) }
      it "should assign @pins with items within a bounding box" do
        campings = Camping.within_bounding_box([51.332168, 4.468309, 52.350285, 7.214891]).top(50)
        should assign_to(:pins).with(campings)
      end
    end
  end
end
