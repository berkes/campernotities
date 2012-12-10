require 'spec_helper'

describe Admin::CampingsController do
  include Devise::TestHelpers

  before(:each) do
    @user = AdminUser.new(:name => "Harry", :email => "admin@example.com", :password =>"password", :password_confirmation => "password")
    @user.save
    sign_in @user
  end

  context "#create" do
    it 'should associate current user as author' do
      post :create, :camping => {:name => "Beautifull Green"}

      @user.campings.first.name.should == "Beautifull Green"
    end
  end

  context "#destroy_image" do
    it 'should set image to nil' do
      @camping = mock_model(Camping).as_null_object
      @image   = mock("Image").as_null_object

      @camping.stub(:image).and_return(@image)
      Camping.stub(:find).and_return(@camping)

      @image.should_receive(:destroy)
      Camping.should_receive(:find).with(@camping.id.to_s)

      delete :destroy_image, :id => @camping.id
      response.should redirect_to :action => :show
    end
  end
end
