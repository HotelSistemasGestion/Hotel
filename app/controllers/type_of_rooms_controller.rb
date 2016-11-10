class TypeOfRoomsController < ApplicationController
  before_action :set_type_of_room, only: [:show, :edit, :update, :destroy]

  autocomplete :type_of_room, :tipo, :extra_data => [:id] do |items|
    respond_to do |format|
      format.json { render :json => @items }
    end
  end
  # GET /type_of_rooms
  # GET /type_of_rooms.json
  def index
    @type_of_rooms = TypeOfRoom.all
  end

  # GET /type_of_rooms/1
  # GET /type_of_rooms/1.json
  def show
  end

  # GET /type_of_rooms/new
  def new
    @type_of_room = TypeOfRoom.new
  end

  # GET /type_of_rooms/1/edit
  def edit
  end

  # POST /type_of_rooms
  # POST /type_of_rooms.json
  def create
    @type_of_room = TypeOfRoom.new(type_of_room_params)

    respond_to do |format|
      if @type_of_room.save
        format.html { redirect_to @type_of_room, notice: 'Type of room was successfully created.' }
        format.json { render :show, status: :created, location: @type_of_room }
      else
        format.html { render :new }
        format.json { render json: @type_of_room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /type_of_rooms/1
  # PATCH/PUT /type_of_rooms/1.json
  def update
    respond_to do |format|
      if @type_of_room.update(type_of_room_params)
        format.html { redirect_to @type_of_room, notice: 'Type of room was successfully updated.' }
        format.json { render :show, status: :ok, location: @type_of_room }
      else
        format.html { render :edit }
        format.json { render json: @type_of_room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /type_of_rooms/1
  # DELETE /type_of_rooms/1.json
  def destroy
    @type_of_room.destroy
    respond_to do |format|
      format.html { redirect_to type_of_rooms_url, notice: 'Type of room was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type_of_room
      @type_of_room = TypeOfRoom.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def type_of_room_params
      params.require(:type_of_room).permit(:tipo, :descripcion)
    end
end
