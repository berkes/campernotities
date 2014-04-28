module CampingsHelper
  def map_tag(lat, lon)
    location = "#{lat},#{lon}"
    link_to({:controller => :maps, :action => :index, :center => location}, {:class => :map}) do
      image_tag "http://maps.googleapis.com/maps/api/staticmap?center=#{location}&size=458x300&zoom=11&sensor=false&markers=#{location}&maptype=hybrid", :class => "map", :alt => "map"
    end
  end
end
