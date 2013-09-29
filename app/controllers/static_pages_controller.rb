class StaticPagesController < ApplicationController

	before_filter :authenticate_user!
	
	# Expand the locales to contain all their children locales 
	# rootlocales is a list of location names
	def expand_locales(rootlocales)
		children = Locale.find(:all, conditions: ["parent in (?)", rootlocales ] )
		if !children.empty?  then
			tmplocales = Array.new;
			children.each do |cl|
				tmplocales << cl.localename;
				rootlocales << cl.localename;
			end
			rootlocales.uniq!
			expand_locales(tmplocales)
		end
	end
	
  def home
  	@micropost = Micropost.new
    
	@followedrelationships = Followedlocale.find(:all)
	@followedrelationships_id = Array.new
	@followedrelationships.each do |f|
		@followedrelationships_id << f.locale_id
	end

	@followedlocals = Locale.find(:all, conditions: [ "id in (?)", @followedrelationships_id ])
	
	@followedlocale_name = Array.new
	@followedlocals.each do |f|
		@followedlocale_name << f.localename
	end	
	expand_locales(@followedlocale_name)
	
	if params[:filter] == "filter" then
		@infotypes = Array.new
		if params[:sight] then @infotypes << "sight"; end
		if params[:note] then @infotypes << "note"; end
		if params[:track] then @infotypes << "track"; end
		if params[:food] then @infotypes << "food"; end
		if params[:hotel] then @infotypes << "hotel"; end
	
			@feed_items = Micropost.paginate(conditions: ["infotype in (?) and parent in (?)", @infotypes, @followedlocale_name], page: params[:page]).order("microposts.created_at DESC")
	else
		@feed_items = Micropost.paginate(conditions: ["parent in (?)", @followedlocale_name], page: params[:page]).order("microposts.created_at DESC")
	end
 end
  
  def travelplanlist
    @travelplans = Travelplan.paginate(page: params[:page])
  end
  
  def help
  end

  def about
  end
end
