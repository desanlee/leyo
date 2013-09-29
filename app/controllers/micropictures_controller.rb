class MicropicturesController < ApplicationController

  
def create
	@micropicture = Micropicture.new(params[:micropicture])
	if @micropicture.save
		flash[:success] = "Micropicture created!"
		redirect_to :back
	else
		render 'static_pages/home'
	end
end
  
def destroy

end
  
end