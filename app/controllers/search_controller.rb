class SearchController < ApplicationController
  def index
    @search = Camping.search(params[:search])
    @campings = @search.all
    @flags   = Label.flags.top(10)
    @selects = Label.selects.top(10)
  end
end
