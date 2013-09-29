class PlanrelationshipsController < ApplicationController

  def create
    @micropost = Micropost.find(params[:planrelationship][:micropost_id])

	Planrelationship.create!(traveltrack_id: $CURRENT_TRAVELTRACK.id, micropost_id: @micropost.id, positionindex: params[:planrelationship][:positionindex])
    redirect_to :back
  end

  def destroy
    @planrelationship = Planrelationship.find(params[:id])
	@planrelationship.destroy
    redirect_to :back
  end
  
  def update
    @current_relationship = Planrelationship.find_by_traveltrack_id_and_micropost_id($CURRENT_PLAN.id, params[:planrelationship][:micropost_id])
    if @current_relationship != nil then
		if @current_relationship.positionindex != 0 then
			@upper_relationship = Planrelationship.find_by_traveltrack_id_and_positionindex($CURRENT_PLAN.id, @current_relationship.positionindex - 1)

			tmpindex = @current_relationship.positionindex
			@current_relationship.positionindex = @upper_relationship.positionindex
			@upper_relationship.positionindex = tmpindex
			@current_relationship.save
			@upper_relationship.save

		end
		redirect_to $CURRENT_PLAN
	else
		respond_to do |format|  
			format.html { render :text => "<script type='text/javascript'>alert('Record not found')</script>" }  
		end
	end
  end
  
end