class CampingsController < ApplicationController
  def show
    @camping = Camping.find(params[:id])
  end
end
