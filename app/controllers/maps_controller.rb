class MapsController < ApplicationController
  def index
    @campings = Camping.top(50)
  end
end
