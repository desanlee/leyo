class FollowedlocalesController < ApplicationController
  
  def create
    @followedlocale = Followedlocale.new(params[:followedlocale])
    if @followedlocale.save
      redirect_to :back
    else
      redirect_to root_url
    end
  end
  
  def destroy
    @followedlocale = Followedlocale.find(params[:id])
	@followedlocale.destroy
	redirect_to :back
  end
  
end