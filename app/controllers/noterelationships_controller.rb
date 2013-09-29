class NoterelationshipsController < ApplicationController

  def create
    @micropost = Micropost.find(params[:noterelationship][:micropost_id])

	Noterelationship.create!(notetrack_id: $CURRENT_NOTETRACK.id, micropost_id: @micropost.id, positionindex: params[:noterelationship][:positionindex])
    redirect_to :back
  end

  def destroy
    @noterelationship = Noterelationship.find(params[:id])
   @noterelationship.destroy
    redirect_to :back
  end
  
  def update
  	  @current_relationship = Noterelationship.find_by_notetrack_id_and_micropost_id($CURRENT_NOTE.id, params[:noterelationship][:micropost_id])
    if @current_relationship != nil then
		if @current_relationship.positionindex != 0 then
			@upper_relationship = Noterelationship.find_by_notetrack_id_and_positionindex($CURRENT_NOTE.id, @current_relationship.positionindex - 1)

			tmpindex = @current_relationship.positionindex
			@current_relationship.positionindex = @upper_relationship.positionindex
			@upper_relationship.positionindex = tmpindex
			@current_relationship.save
			@upper_relationship.save

		end
		redirect_to $CURRENT_NOTE
	else
		respond_to do |format|  
			format.html { render :text => "<script type='text/javascript'>alert('Record not found')</script>" }  
		end
	end
  end
  
end