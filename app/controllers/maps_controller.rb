class MapsController < ApplicationController
  def index
    @title = "Discover Campings by Location"
    @campings = []

    unless params[:bounding].nil?
      box = params[:bounding].split(',').map{|bearing| bearing.to_f}
      Camping.within_bounding_box(box).top(50).each do |camping|
        rendered = camping.attributes
        rendered["listing"] = render_to_string(
          :file => "campings/_camping",
          :formats =>   "html",
          :layout  => false,
          :locals => {:camping => camping})
        rendered["infowindow"] = render_to_string(
          :file => "campings/_infowindow",
          :formats => "html",
          :layout => false,
          :locals => {:camping => camping})

        @campings << rendered
      end
    end

    respond_to do |format|
      format.html
      format.json { render :json => @campings }
    end
  end
end
