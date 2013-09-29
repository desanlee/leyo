class LocalesController < ApplicationController

  def show
  	  @locale = Locale.new(params[:locale])
  	  if params[:id] != nil then
  	  	  @plocale = Locale.find(params[:id])
  	else
  		# 22 is the locale of China
  		@plocale = Locale.find_by_id(22) 
  	end
  	  @alllocales=Locale.find(:all)
  	  
  	  if  @plocale != nil then
  	  	  @parentlocale = Locale.find_by_localename(@plocale.parent)
		  @locales=Locale.paginate(page: params[:page]).find(:all, conditions: [ "parent is (?)",  @plocale.parent ])
		  @childlocales=Locale.paginate(page: params[:page]).find(:all, conditions: [ "parent is (?)",  @plocale.localename])
	  else
	  	  @parentlocale = nil
		  @locales=Locale.paginate(page: params[:page]).find(:all, conditions: [ "parent is 'test'"])
		  @childlocales=nil
	  end
  	  @followedrelationships = Followedlocale.paginate(page: params[:page])
  	  @followedlocale = Followedlocale.new(params[:followedlocale])
  end
  
  def create
    @locale = Locale.new(params[:locale])
    if @locale.save
      redirect_to :back
    else
      redirect_to root_url
    end
  end


  def update
    @locale = Locale.find(params[:id])
    if @locale.update_attributes(params[:locale])
      flash[:success] = "Locale updated!"
      redirect_to :back
    else
      render 'edit'
    end
  end
  
  def destroy
    @locale = Locale.find(params[:id])
	@locale.destroy
	redirect_to :back
  end
  
end