class AuthorsController < ApplicationController
  def index
    @authors = AdminUser.find(:all)
    @title   = "Discover Campings by Author"
  end

  def home
    @authors = AdminUser.find(:all)
  end

  def show
    @author   = AdminUser.find(params[:id])
    @campings = @author.campings
  end
end
