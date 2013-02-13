require 'spec_helper'

describe MapsController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
    it "fetches the 50 latest campings" do
      Camping.should_receive(:top).with(50)
      get 'index'
    end
  end

end
