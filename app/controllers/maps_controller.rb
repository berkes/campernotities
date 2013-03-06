class MapsController < ApplicationController
  def index
    @pins = Camping.geocoded.top(50)
  end
end
