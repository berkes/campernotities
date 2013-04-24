require 'spec_helper'

describe MapsController do
  describe "GET 'index'" do
    before :all do
      @campings = FactoryGirl.create_list(:camping_with_geo, 5)
    end

    context "HTML" do
      before do
        get :index
      end
      it { should assign_to(:title) }
      it { should respond_with(:success) }
    end

    context "JSON" do
      context "no bounds" do
        before do
          get :index, :format => :json
        end
        it { should respond_with(:success) }

        it 'should have the pins as JSON' do
          response.body.should eq [].to_json
        end
      end

      context "bounded" do
        before do
          get :index, :bounding => "51.332168,4.468309,52.350285,7.214891", :format => :json
        end
        it { should respond_with(:success) }
        it { should assign_to(:campings) }

        context "included HTML" do
          render_views
          it "should include an infowindow version" do
            should render_template("campings/_infowindow")
            ActiveSupport::JSON.decode(response.body).first["infowindow"].should_not be_empty
          end
          it "should include a listing version" do
            should render_template("campings/_camping")
            ActiveSupport::JSON.decode(response.body).first["listing"].should_not be_empty
          end
        end
      end
    end
  end
end
