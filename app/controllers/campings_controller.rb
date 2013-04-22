class CampingsController < ApplicationController
  def show
    @camping = Camping.find(params[:id])
    @title   = @camping.name
  end
end
