class CampingsController < ApplicationController
  def index
    @campings = Camping.find(:all)
    @count = @campings.count
  end

  def show
    @camping = Camping.find(params[:id])
  end
end
