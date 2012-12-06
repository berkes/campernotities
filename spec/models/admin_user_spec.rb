require 'spec_helper'

describe AdminUser do
  before(:each) do
    @admin_user = AdminUser.new(
      :name  => "Harry",
      :email => "admin@example.com",
      :password => "password", :password_confirmation => "password"
    )
  end

  it {should have_many(:campings) }

  it {@admin_user.should validate_presence_of(:email)}
  it {@admin_user.should validate_presence_of(:password)}
  it {@admin_user.should validate_presence_of(:name)}
end
