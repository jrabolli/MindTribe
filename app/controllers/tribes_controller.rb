class TribesController < ApplicationController
  def new
  	@title = "Create a Tribe"
    @tribe = Tribe.new

  end

  def show
  	#@title = @tribe.name
    @tribe = Tribe.find(params[:id])
  end

  def index
  	@title = "All Tribes"
    @tribe = Tribe.paginate(:page => params[:page], :per_page => 8, :order => 'name ASC')

  end

end


# chap 6

