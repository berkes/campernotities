module FeatureHelper
  def the_user
    @user ||= AdminUser.find(:first)

    @user
  end
  def the_camping
    @camping ||= Camping.find(:first)
  end
end

World(FeatureHelper)
