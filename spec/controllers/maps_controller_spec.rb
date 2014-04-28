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
      it { should assign_to(:search) }
      it { should assign_to(:flags).with_kind_of(Array) }
      it { should assign_to(:selects).with_kind_of(Array) }
      it { should respond_with(:success) }
      describe "labels" do
        it 'should be the top 10' do
          Label.should_receive(:top).with(10).twice.and_return([])
          get :index
        end
      end
    end

    describe "center" do
      context 'uncentered' do
        it 'should pass default center params to the map generator' do
          get :index
          assigns(:center)[:lat].should eq '51.71154'
          assigns(:center)[:lon].should eq '6.0503'
        end
      end

      context 'centered' do
        it  'should pass the center params to the map generator' do
          get :index, :center => '13.37,3.14'  # maps?center=13.37,3.14
          assigns(:center)[:lat].should eq '13.37'
          assigns(:center)[:lon].should eq '3.14'
        end
      end
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
          @bounding = "51.332168,4.468309,52.350285,7.214891"
          get :index, :format => :json, :bounding => @bounding
        end
        it { should respond_with(:success) }
        it { should assign_to(:campings) }

        it 'should use metasearch to determine the campings' do
          # Create two campings
          FactoryGirl.create(:camping, :labels => [FactoryGirl.create(:label, :name => "Dogs Allowed", :value => nil)])
          FactoryGirl.create(:camping)

          # Set a search that matches only one of the created campings
          search_params = {"labels_name_contains_any"=>["Dogs Allowed"]}

          get(:index, :format => :json, :bounding => @bounding, :search => search_params )
          assigns(:campings).length.should eq 1
        end

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
