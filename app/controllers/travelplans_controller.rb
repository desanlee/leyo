class TravelplansController < ApplicationController

	# Expand the locales to contain all their children locales 
	# rootlocales is a list of location names
	def expand_locales(rootlocales)
		children = Locale.find(:all, conditions: ["parent in (?)", rootlocales ] )
		if !children.empty?  then
			tmplocales = Array.new;
			children.each do |sl|
				tmplocales << sl.localename;
				rootlocales << sl.localename;
			end
			rootlocales.uniq!
			expand_locales(tmplocales);
		end
	end
	
  def index
    @travelplans = Travelplan.paginate(page: params[:page])
    @travelplan = Travelplan.new(params[:travelplan])
  end

  def newplan
    @travelplan = Travelplan.new(params[:travelplan])
  end
  
  def create
    @travelplan = Travelplan.new(params[:travelplan])
    if @travelplan.save
      redirect_to @travelplan
    else
      redirect_to root_url
    end
  end

  def show
	@travelplan = Travelplan.find(params[:id])
	@micropost = Micropost.new
	$CURRENT_PLAN = @travelplan
	@planmicropost = Micropost.new
	@traveltrack = Traveltrack.new
	@currentindex = 0
	@alllocales = Array.new
	@alllocales << $CURRENT_LOCALE
	expand_locales(@alllocales)
	@feed_items = Micropost.paginate(conditions: ["parent in (?)", @alllocales], page: params[:page]).order("microposts.created_at DESC")
  end
  
  def readview 
  	  @travelplan = Travelplan.find(params[:id])
  	  render layout: 'readview'
  end

  def createnote
  	  @travelnote = Travelnote.new
  	  @travelnote.locale = $CURRENT_PLAN.locale
  	  @travelnote.notename = $CURRENT_PLAN.planname
  	  @travelnote.save
  	  $CURRENT_PLAN.traveltracks.each do |pt|
  	  	  @notetrack = Notetrack.new
  	  	  @notetrack.note_id = @travelnote.id
  	  	  @notetrack.startpoint = pt.startpoint
  	  	  @notetrack.terminal = pt.terminal
  	  	  @notetrack.save
  	  end
  	  redirect_to @travelnote
  end
  
  def edit
    @travelplan = Travelplan.find(params[:id])
  end

  def update
    @travelplan = Travelplan.find(params[:id])
    if @travelplan.update_attributes(params[:travelplan])
      flash[:success] = "Travelplan updated!"
      redirect_to :back
    else
      render 'edit'
    end
  end
  
  def destroy
    @travelplan = Travelplan.find(params[:id])
	@travelplan.destroy
	redirect_to '/travelplanindex'
  end
  
end