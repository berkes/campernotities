require "spec_helper"

describe CampingsHelper do
  describe "map_tag" do
    it "renders an image tag with a static google map" do
      map_tag(12,35).should include "maps.googleapis.com"
      map_tag(12,35).should include "center=12,35"
      map_tag(12,35).should include "markers=12,35"
    end
    it "links to the center of the map" do
      map_tag(12,35).should include %Q{href="#{url_for(:controller => :maps, :action => :index, :center => '12,35')}"}
    end
  end
end
