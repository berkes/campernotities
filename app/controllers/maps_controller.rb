class MapsController < ApplicationController
  def index
    @pins  = Camping.geocoded.top(50)
    @title = "Discover Campings by Location"
  end
end
