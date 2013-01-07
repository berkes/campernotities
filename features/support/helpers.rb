module FeatureHelper
  def camping(params = {})
    if params.include? :author
      author = params.delete :author
    else
      author = user
    end
    params = {:name => "Beautifull Green"}.merge params
    camping = Camping.new(params)
    camping.author = author
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
