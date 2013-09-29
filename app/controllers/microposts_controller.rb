class MicropostsController < ApplicationController

  def index
  end
  
  def create
    @micropost = Micropost.new(params[:micropost])
    if @micropost.save
      flash[:success] = "Micropost created!"
      if @micropost.owner then
      	      Noterelationship.create!(notetrack_id: @micropost.owner, micropost_id: @micropost.id)
      	      end
      redirect_to :back
    else
      render 'static_pages/home'
    end
  end
  
  def newnotemicropost
    @micropost = Micropost.new(params[:micropost])
    @micropost.save
      
     Noterelationship.create!(notetrack_id: @micropost.owner, micropost_id: @micropost.id)
    
      redirect_to :back
  end
  
  def destroy
    @micropost = Micropost.find(params[:id])
	@micropost.destroy
	redirect_to :back
  end
end