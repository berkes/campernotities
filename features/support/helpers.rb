module FeatureHelper
  def the_user
    @user ||= AdminUser.find(:first)

    @user
  end
end

World(FeatureHelper)
