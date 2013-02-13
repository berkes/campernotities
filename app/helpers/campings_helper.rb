module CampingsHelper
  def map_tag options
    defaults = {
      :latitude => 0,
      :longitude => 0,
      :width => 400,
      :height => 400
    }
    options = defaults.merge(options)

    location = "#{options[:latitude]},#{options[:longitude]}"
    size     = "#{options[:width]}x#{options[:height]}"
    image_tag "http://maps.googleapis.com/maps/api/staticmap?center=#{location}&size=#{size}&zoom=11&sensor=false&markers=#{location}&maptype=hybrid", :class => "map"
  end
end
