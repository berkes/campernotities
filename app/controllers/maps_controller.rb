class MapsController < ApplicationController
  def index
    if params[:bounding].nil?
      @pins = Camping.geocoded.top(50)
    else
      box = params[:bounding].split(',').map{|bearing| bearing.to_f}
      @pins = Camping.within_bounding_box(box).top(50)
    end
    @title = "Discover Campings by Location"
    respond_to do |format|
      format.html
      format.json { render :json => @pins }
    end
  end
end
