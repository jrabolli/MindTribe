class PagesController < ApplicationController
  
  def home
    @title = "Home"
    if signed_in?
      @micropost = Micropost.new
      @feed_items = current_user.feed.paginate(:page => params[:page])

      #load current_user's folders  
      @folders = current_user.folders.order("name desc")

      #added for clippings
      @clippings = current_user.clippings.order("uploaded_file_file_name desc")
    end
  end

  def contact
    @title = "Contact"
  end
  
  def about
    @title = "About"
  end
  
  def help
    @title = "Help"
  end



  #this action is for viewing folders  
def browse  
    #get the folders owned/created by the current_user  
    @current_folder = current_user.folders.find(params[:folder_id])    
  
    if @current_folder  
    
      #getting the folders which are inside this @current_folder  
      @folders = @current_folder.children  
  
      #We need to fix this to show files under a specific folder if we are viewing that folder  
      @clippings = current_user.clippings.order("uploaded_file_file_name desc")  
  
      render :action => "home"  
    else  
      flash[:error] = "Don't be cheeky! Mind your own folders!"  
      redirect_to root_url  
    end  
end  



end
