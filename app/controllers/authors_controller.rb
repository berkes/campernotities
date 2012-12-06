class AuthorsController < ApplicationController

  def show
    @author   = AdminUser.find(params[:id])
    @campings = @author.campings
  end
end
