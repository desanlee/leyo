class NotetracksController < ApplicationController

  def index
  end
  
  def newlocale
  	  @locale = Locale.new
  	  @locale.parent = $CURRENT_NOTE.locale
  	  @locale.localename = @notetrack.terminal
  	  @locale.save
  end
  
  def create
    @notetrack = Notetrack.new(params[:notetrack])
	@notetrack.note_id = $CURRENT_NOTE.id
	@notetrack.positionindex = $CURRENT_INDEX + 1
    if @notetrack.save
      flash[:success] = "notetrack created!"
      newlocale
      redirect_to :back
    else
      render 'static_pages/home'
    end
  end
  
  def edit
	@notetrack = Notetrack.find(params[:id])
	$CURRENT_NOTETRACK = @notetrack
	redirect_to :back
  end
  
  def destroy
    @notetrack = Notetrack.find(params[:id])
	@notetrack.destroy
	redirect_to :back
  end
  
  def update
	@notetrack = Notetrack.find(params[:id])
	i = 0
	while @upper_notetrack == nil
		i = i + 1
		@upper_notetrack = Notetrack.find_by_note_id_and_positionindex($CURRENT_NOTE.id, @notetrack.positionindex - i)
	end
	if @upper_notetrack != nil 
		tmpindex = @notetrack.positionindex
		@notetrack.positionindex = @upper_notetrack.positionindex
		@upper_notetrack.positionindex = tmpindex
		@notetrack.save
		@upper_notetrack.save
	end
	redirect_to :back
  end
  
end