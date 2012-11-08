class TribesController < ApplicationController
  def new
  	@title = "Create a Tribe"
    @tribe = Tribe.new
  end

  def create
    @tribe = Tribe.new(params[:tribe])
    if @tribe.save
      flash[:success] = "...and so a new Tribe begins"
      redirect_to @tribe

      # Handle a successful save.
    else
      @title = "Create a Tribe"
      render 'new'
    end
  end




  def show
  	#@title = @tribe.name
    @tribe = Tribe.find(params[:id])
  end

  def index
  	@title = "All Tribes"
    @tribes = Tribe.paginate(:page => params[:page], :per_page => 8, :order => 'name ASC')

  end

end


# 8.2.2

