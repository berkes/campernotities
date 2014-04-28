class MapsController < ApplicationController
  def index
    @title = "Discover Campings by Location"
    @center = center_params
    @search = Camping.search(params[:search])
    @flags   = Label.flags.top(10)
    @selects = Label.selects.top(10)
    @campings = []

    unless params[:bounding].nil?
      box = params[:bounding].split(',').map{|bearing| bearing.to_f}
      Camping.within_bounding_box(box).top(50).search(params[:search]).each do |camping|
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

  private
  def center_params
    lat, lon = params[:center].try(:split, ',')
    { :lat => (lat || '51.71154'), lon: (lon || '6.0503') }
  end
end
