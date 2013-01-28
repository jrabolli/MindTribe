class BarriersController < ApplicationController
  # GET /barriers
  # GET /barriers.json
  def index
    @barriers = Barrier.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @barriers }
    end
  end

  # GET /barriers/1
  # GET /barriers/1.json
  def show
    @barrier = Barrier.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @barrier }
    end
  end

  # GET /barriers/new
  # GET /barriers/new.json
  def new
    @barrier = Barrier.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @barrier }
    end
  end

  # GET /barriers/1/edit
  def edit
    @barrier = Barrier.find(params[:id])
  end

  # POST /barriers
  # POST /barriers.json
  def create
    @barrier = Barrier.new(params[:barrier])

    respond_to do |format|
      if @barrier.save
        format.html { redirect_to @barrier, notice: 'Barrier was successfully created.' }
        format.json { render json: @barrier, status: :created, location: @barrier }
      else
        format.html { render action: "new" }
        format.json { render json: @barrier.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /barriers/1
  # PUT /barriers/1.json
  def update
    @barrier = Barrier.find(params[:id])

    respond_to do |format|
      if @barrier.update_attributes(params[:barrier])
        format.html { redirect_to @barrier, notice: 'Barrier was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @barrier.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /barriers/1
  # DELETE /barriers/1.json
  def destroy
    @barrier = Barrier.find(params[:id])
    @barrier.destroy

    respond_to do |format|
      format.html { redirect_to barriers_url }
      format.json { head :no_content }
    end
  end
end
