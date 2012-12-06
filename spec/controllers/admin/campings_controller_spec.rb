require 'spec_helper'

describe Admin::CampingsController do
  include Devise::TestHelpers

  context "#create" do
    it 'should associate current user as author' do
      @user = AdminUser.new(:name => "Harry", :email => "admin@example.com", :password =>"password", :password_confirmation => "password")
      @user.save
      sign_in @user

      post :create, :camping => {:name => "Beautifull Green"}

      @user.campings.first.name.should == "Beautifull Green"
    end
  end
end
