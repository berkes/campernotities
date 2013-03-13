class SearchController < ApplicationController
  def index
    @campings = Camping.search(params[:search])
  end
end
