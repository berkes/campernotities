module FeatureHelper
  def camping(params = {})
    params = {:name => "Beautifull Green"}.merge params
    camping = Camping.new(params)
    camping.author = user
    camping.save!

    camping
  end

  def user(params = {})
    if @user.nil?
      params = {
        :email                 => "admin@example.com",
        :name                  => "Example",
        :password              => "secret",
        :password_confirmation => "secret"
      }.merge params
      @user = AdminUser.new(params)
      @user.save!
    end
    @user
  end
end
