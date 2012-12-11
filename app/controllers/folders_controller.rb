class FoldersController < ApplicationController

#changed after Codey github review
  before_filter :authenticate

  # GET /folders
  # GET /folders.json
  def index
    @folders = current_user.folders

   # respond_to do |format|
   #   format.html # index.html.erb
   #   format.json { render json: @folders }
   # end
  end

  # GET /folders/1
  # GET /folders/1.json
  def show
    @folder = current_user.folders.find(params[:id])  


    #respond_to do |format|
    #  format.html # show.html.erb
    #  format.json { render json: @folder }
    #end
  end

  # GET /folders/new
  # GET /folders/new.json
  def new
    @folder = current_user.folders.new  

    #if there is "folder_id" param, we know that we are under a folder, thus, we will essentially create a subfolder  
   if params[:folder_id] #if we want to create a folder inside another folder  
       
     #we still need to set the @current_folder to make the buttons working fine  
     @current_folder = current_user.folders.find(params[:folder_id])  
       
     #then we make sure the folder we are creating has a parent folder which is the @current_folder  
     @folder.parent_id = @current_folder.id  
   end  

    #respond_to do |format|
    #  format.html # new.html.erb
    #  format.json { render json: @folder }
    #end
  end

  # GET /folders/1/edit
  def edit
    @folder = current_user.folders.find(params[:folder_id])  
    @current_folder = @folder.parent    #this is just for breadcrumbs 

  end

  # POST /folders
  # POST /folders.json
  def create
    @folder = current_user.folders.new(params[:folder])  

    #respond_to do |format|
      if @folder.save
        flash[:notice] = "Successfully created folder." #(temp)  

        #format.html { redirect_to @folder, notice: 'Folder was successfully created.' }
        #format.json { render json: @folder, status: :created, location: @folder }
      
        if @folder.parent #checking if we have a parent folder on this one  
          redirect_to browse_path(@folder.parent)  #then we redirect to the parent folder  
        else  
          redirect_to root_url #if not, redirect back to home page (temp) 
        end  


      else
        render :action => 'new'
        #format.html { render action: "new" }
        #format.json { render json: @folder.errors, status: :unprocessable_entity }
      end
    #end
  end

  # PUT /folders/1
  # PUT /folders/1.json
  

  def update
    @folder = current_user.folders.find(params[:id])  


    #respond_to do |format|
      if @folder.update_attributes(params[:folder])
        redirect_to @folder, :notice  => "Successfully updated folder."

        #format.html { redirect_to @folder, notice: 'Folder was successfully updated.' }
        #format.json { head :ok }
      else
        render :action => 'edit'

        #format.html { render action: "edit" }
        #format.json { render json: @folder.errors, status: :unprocessable_entity }
      end
    #end
  end

  # DELETE /folders/1
  # DELETE /folders/1.json
  def destroy  
   @folder = current_user.folders.find(params[:id])  
   @parent_folder = @folder.parent #grabbing the parent folder  
  
   #this will destroy the folder along with all the contents inside  
   #sub folders will also be deleted too as well as all files inside  
   @folder.destroy  
   flash[:notice] = "Successfully deleted the folder and all the contents inside."  
  
   #redirect to a relevant path depending on the parent folder  
   if @parent_folder  
    redirect_to browse_path(@parent_folder)  
   else  
    redirect_to clippingsHome_url        
   end  
  end  
end
