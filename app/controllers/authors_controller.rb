class AuthorsController < ApplicationController
  def index
    @authors = AdminUser.find(:all)
    @title   = "Discover Campings by Author"
  end

  def home
    @authors = AdminUser.find(:all)
    @campings = Camping.top(10)
  end

  def show
    @author   = AdminUser.find(params[:id])
    @campings = @author.campings
    @title    = "Discover Campings by #{@author.name}"
  end
end
