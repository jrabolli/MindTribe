#require 'open-uri'

class ClippingsController < ApplicationController

    before_filter :signed_in_user

  # GET /clippings
  # GET /clippings.json
  def index
    @clippings = current_user.clippings

    #respond_to do |format|
    #  format.html # index.html.erb
    #  format.json { render json: @clippings }
    #end
  end

  # GET /clippings/1
  # GET /clippings/1.json
  def show
    @clipping = current_user.clippings.find(params[:id])

    #respond_to do |format|
    #  format.html # show.html.erb
    #  format.json { render json: @clipping }
    #end
  end

  # GET /clippings/new
  # GET /clippings/new.json
  def new
    @clipping = current_user.clippings.build      
    if params[:folder_id] #if we want to upload a file inside another folder  
      @current_folder = current_user.folders.find(params[:folder_id])  
      @clipping.folder_id = @current_folder.id  
    end      
  end

  # GET /clippings/1/edit
  def edit
    @clipping = current_user.clippings.find(params[:id])

  end

  # POST /clippings
  # POST /clippings.json
  def create
    @clipping = current_user.clippings.build(params[:clipping])  
    if @clipping.save  
      flash[:notice] = "Successfully uploaded the file."  
  
      if @clipping.folder #checking if we have a parent folder for this file  
        redirect_to browse_path(@clipping.folder)  #then we redirect to the parent folder  
      else  
        redirect_to clippingsHome_url  
      end        
    else  
      render :action => 'new'  
    end  
  end

  # PUT /clippings/1
  # PUT /clippings/1.json
  def update #this action changed after reviewing Codey github
    @clipping = current_user.clippings.find(params[:id])
    #@clipping = current_user.find(params[:id])


    #respond_to do |format|
      if @clipping.update_attributes(params[:clipping])
        redirect_to @clipping, :notice  => "Successfully updated clipping."
     #   format.html { redirect_to @clipping, notice: 'Clipping was successfully updated.' }
     #   format.json { head :ok }
      else
        render :action => 'edit'
     #   format.html { render action: "edit" }
     #   format.json { render json: @clipping.errors, status: :unprocessable_entity }
      end
    #end
  end


  # DELETE /clippings/1
  # DELETE /clippings/1.json
  def destroy  
    @clipping = current_user.clippings.find(params[:id])  
    @parent_folder = @clipping.folder #grabbing the parent folder before deleting the record  
    @clipping.destroy  
    flash[:notice] = "Successfully deleted the clipping."  
  
  #redirect to a relevant path depending on the parent folder  
    if @parent_folder  
      redirect_to browse_path(@parent_folder)  
    else  
      redirect_to clippingsHome_url  
    end  
  end  


  def get  
    clipping = current_user.clippings.find_by_id(params[:id])  
    clipping ||= Clipping.find(params[:id]) if current_user.has_share_access?(Clipping.find_by_id(params[:id]).folder)  
      
      if clipping  
        #Parse the URL for special characters first before downloading  
        #data = open(URI.parse(URI.encode(clipping.uploaded_file.url)))  
        #data = open(clipping.uploaded_file.url)
        #send_data data, :filename => clipping.uploaded_file_file_name  
        #send_data data, :filename => clipping.file_name
        #redirect_to clipping.uploaded_file.url
        send_file clipping.uploaded_file.path, :type => clipping.uploaded_file_content_type
      else  
        flash[:error] = "Don't be cheeky! Mind your own clippings!"  
        redirect_to clippings_path  
      end  
  end  

end
