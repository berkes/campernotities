class CampingsController < ApplicationController
  def index
    @campings = Camping.find(:all)
    @count = @campings.count
  end

  def show
    @camping = Camping.find(params[:id])
  end

  def new
    @camping = Camping.new
  end
  
  def create
    @camping = Camping.new(params[:camping])
    if @camping.save
      redirect_to(@camping)
    else
      render :action => "new"
    end
  end
end
