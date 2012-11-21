class PagesController < ApplicationController
  
  def home
    @title = "Home"
    if signed_in?
      @micropost = Micropost.new
      @feed_items = current_user.feed.paginate(:page => params[:page]) 
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

  def clippings_home
    @title = "Clippings Home"

    if signed_in?
      #show only root folders (which have no parent folders)  
      @folders = current_user.folders.roots

      #show only root files which has no "folder_id"  
      @clippings = current_user.clippings.where("folder_id is NULL").order("uploaded_file_file_name desc") 
    end
  end



  #this action is for viewing folders  
def browse  
    #get the folders owned/created by the current_user  
    @current_folder = current_user.folders.find(params[:folder_id])    
  
    if @current_folder  
    
      #getting the folders which are inside this @current_folder  
      @folders = @current_folder.children  
  
      #show only files under this current folder  
      @clippings = @current_folder.clippings.order("uploaded_file_file_name desc") 
  
      render :action => "clippings_home"  
    else  
      flash[:error] = "Don't be cheeky! Mind your own folders!"  
      redirect_to root_url  
    end  
end  



end
