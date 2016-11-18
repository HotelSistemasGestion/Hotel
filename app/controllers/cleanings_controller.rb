class CleaningsController < ApplicationController
  before_action :set_cleaning, only: [:show, :edit, :update, :destroy]

  # GET /cleanings
  # GET /cleanings.json
  def index
    if(params[:dato] == nil) 
      @cleanings = Cleaning.all
      puts "entre en cleanings es nulo dato"
    else
      @cleanings = Cleaning.where("#{:room_id} = ?", params[:dato]) 
      @dato = params[:dato]
      #redirect_to cleaning_rooms_url
     # render "cleaning_rooms/index"
    end
    
  end

  # GET /cleanings/1
  # GET /cleanings/1.json
  def show
    #  @cleanings = Cleaning.where("#{:room_id} = ?", params[:id]) 
  end

  # GET /cleanings/new
  def new
    @cleaning = Cleaning.new
  end

  # GET /cleanings/1/edit
  def edit
  end

  # POST /cleanings
  # POST /cleanings.json
  def create
    @cleaning = Cleaning.new(cleaning_params)

    respond_to do |format|
      if @cleaning.save
        format.html { redirect_to @cleaning, notice: 'Cleaning was successfully created.' }
        format.json { render :show, status: :created, location: @cleaning }
      else
        format.html { render :new }
        format.json { render json: @cleaning.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cleanings/1
  # PATCH/PUT /cleanings/1.json
  def update
    respond_to do |format|
      if @cleaning.update(cleaning_params)
        format.html { redirect_to @cleaning, notice: 'Cleaning was successfully updated.' }
        format.json { render :show, status: :ok, location: @cleaning }
      else
        format.html { render :edit }
        format.json { render json: @cleaning.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cleanings/1
  # DELETE /cleanings/1.json
  def destroy
    @cleaning.destroy
    respond_to do |format|
      format.html { redirect_to cleanings_url, notice: 'Cleaning was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cleaning
      @cleaning = Cleaning.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cleaning_params
      params.require(:cleaning).permit(:cleaning_room_id, :room_id, :start, :end, :title)
    end
end
