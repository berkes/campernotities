require 'spec_helper'

describe Admin::CampingsController do
  include Devise::TestHelpers

  before(:each) do
    #@image_attrs = FactoryGirl.attributes_for(:image)
    @image_attrs = {:image => Rack::Test::UploadedFile.new('spec/fixtures/images/green_small.jpg', 'image/jpg') }
    @user = AdminUser.new(:name => "Harry", :email => "admin@example.com", :password =>"password", :password_confirmation => "password")
    @user.save
    sign_in @user
  end

  context "#create" do
    it 'should associate current user as author' do
      post :create, :camping => {:name => "Beautifull Green", :images_attributes => [@image_attrs]}

      @user.campings.first.name.should == "Beautifull Green"
    end
  end

  # @TODO remove method, covered with delete checkbox now.
  #context "#destroy_image" do
    #it 'should set image to nil' do
      #@camping = mock_model(Camping).as_null_object

      #@camping.stub(:image).and_return(@image)
      #Camping.stub(:find).and_return(@camping)

      #Camping.should_receive(:find).with(@camping.id.to_s)
      #@camping.should_receive(:image=).with(nil)
      #@camping.should_receive(:save!)

      #delete :destroy_image, :id => @camping.id
      #response.should redirect_to :action => :show
    #end
  #end
end
