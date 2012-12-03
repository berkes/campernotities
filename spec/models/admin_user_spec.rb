require 'spec_helper'

describe AdminUser do
  # Devise stuff ignored
  context "campings" do
    before(:each) do
      @admin_user = AdminUser.new(
        :email => "admin@example.com",
        :password => "password",
        :password_confirmation => "password"
      )
      @admin_user.save!
    end

    it "should have associated campings" do
      @admin_user.campings.should be_kind_of Array
    end
  end
end
