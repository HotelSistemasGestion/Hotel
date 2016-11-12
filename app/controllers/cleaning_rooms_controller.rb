class CleaningRoomsController < ApplicationController
  before_action :set_cleaning_room, only: [:show, :edit, :update, :destroy]

  # GET /cleaning_rooms
  # GET /cleaning_rooms.json
  def index
    @cleaning_rooms = CleaningRoom.all
  end

  # GET /cleaning_rooms/1
  # GET /cleaning_rooms/1.json
  def show
  end

  # GET /cleaning_rooms/new
  def new
    @cleaning_room = CleaningRoom.new
    @cleaning_room.cleanings.build
  end

  # GET /cleaning_rooms/1/edit
  def edit
  end

  # POST /cleaning_rooms
  # POST /cleaning_rooms.json
  def create
    @cleaning_room = CleaningRoom.new(cleaning_room_params)

    respond_to do |format|
      if @cleaning_room.save
        format.html { redirect_to @cleaning_room, notice: 'Cleaning room was successfully created.' }
        format.json { render :show, status: :created, location: @cleaning_room }
      else
        format.html { render :new }
        format.json { render json: @cleaning_room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cleaning_rooms/1
  # PATCH/PUT /cleaning_rooms/1.json
  def update
    respond_to do |format|
      if @cleaning_room.update(cleaning_room_params)
        format.html { redirect_to @cleaning_room, notice: 'Cleaning room was successfully updated.' }
        format.json { render :show, status: :ok, location: @cleaning_room }
      else
        format.html { render :edit }
        format.json { render json: @cleaning_room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cleaning_rooms/1
  # DELETE /cleaning_rooms/1.json
  def destroy
    @cleaning_room.destroy
    respond_to do |format|
      format.html { redirect_to cleaning_rooms_url, notice: 'Cleaning room was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cleaning_room
      @cleaning_room = CleaningRoom.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cleaning_room_params
      params.require(:cleaning_room).permit(:room_id, :employee_id, :start,:end,:title,:cleanings_attributes => [:room_id,:start,:end,:title,:color,:textColor,:_destroy])
    end
end
