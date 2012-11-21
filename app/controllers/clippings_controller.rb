class ClippingsController < ApplicationController

    before_filter :authenticate

  # GET /clippings
  # GET /clippings.json
  def index
    @clippings = current_user.clippings

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @clippings }
    end
  end

  # GET /clippings/1
  # GET /clippings/1.json
  def show
    @clipping = current_user.clippings.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @clipping }
    end
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
        redirect_to root_url  
      end        
    else  
      render :action => 'new'  
    end  
  end

  # PUT /clippings/1
  # PUT /clippings/1.json
  def update
    @clipping = current_user.find(params[:id])


    respond_to do |format|
      if @clipping.update_attributes(params[:clipping])
        format.html { redirect_to @clipping, notice: 'Clipping was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @clipping.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clippings/1
  # DELETE /clippings/1.json
  def destroy
    @clipping = current_user.clippings.find(params[:id])

    @clipping.destroy

    respond_to do |format|
      format.html { redirect_to clippings_url, notice: 'Clipping was successfully destroyed.' }
      format.json { head :ok }
    end
  end

  #this action will let the users download the files (after a simple authorization check)  
def get  
    clipping = current_user.clippings.find_by_id(params[:id])  
      if clipping  
        send_file clipping.uploaded_file.path, :type => clipping.uploaded_file_content_type  
      else  
        flash[:error] = "Don't be cheeky! Mind your own clippings!"  
        redirect_to clippings_path  
      end  
end  



end
