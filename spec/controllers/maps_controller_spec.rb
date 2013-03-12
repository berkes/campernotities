require 'spec_helper'

describe MapsController do
  describe "GET 'index'" do
    it "returns http success" do
      get :index
      response.should be_success
    end
    it "fetches only geocoded campings" do
      campings = mock
      campings.stub(:top).and_return(campings)
      Camping.should_receive(:geocoded).and_return(campings)
      get :index
    end
    it "fetches the 50 latest campings" do
      Camping.should_receive(:top).with(50)
      get :index
    end
    it "assign the campings to pins" do
      get :index
      expect(assigns(:pins)).to eq(Camping.top(50).geocoded)
    end
  end

end
