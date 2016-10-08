class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy]

  # GET /rooms
  # GET /rooms.json
  def index
    @rooms = Room.all
    @room =Room.new
    @type_of_rooms = TypeOfRoom.all
  end

  # GET /rooms/1
  # GET /rooms/1.json
  def show
    @room_comfort = RoomComfort.where("#{:room_id} = ?", params[:id])
    @room_comfort.each do |room| 
      destruir_repetidos(room.room_id,room.comfort_id);
    end  
    @room_comforts = @room_comfort;
   
   # @r = Comfort.where("#{:room_id} = ?", params[room_comforts.room_id])
    @room = Room.find(params[:id])
     respond_to do |format|
      format.js
    end

  end

  # GET /rooms/new
  def new
    @room = Room.new
    @room.room_comforts.build
  end

  # GET /rooms/1/edit
  def edit
  end

  # POST /rooms
  # POST /rooms.json
  def create
 
    @room = Room.new(room_params)
    respond_to do |format|
      if @room.save
        format.js { }

      else
        format.js {}

       
    
      end
    end
  end

  # PATCH/PUT /rooms/1
  # PATCH/PUT /rooms/1.json
  def update 
   @room_comforts = RoomComfort.all
    respond_to do |format|

       if @room.update(room_params)  
       format.js {}
    @room_comforts.each do |room| 
      destruir_repetidos(room.room_id,room.comfort_id);
    end  

      else
        format.html { render :edit }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
    
  end

  # DELETE /rooms/1
  # DELETE /rooms/1.json
  def destroy
    @room.destroy
    respond_to do |format|
      format.html { redirect_to rooms_url, notice: 'Room was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_params
      params.require(:room).permit(:type_of_room_id, :state_id, :capacidad, :identificador,room_comforts_attributes: [:room_id,:comfort_id,:_destroy])
     
    end
    def destruir_repetidos(room_id,comfort_id)
      if(RoomComfort.where("room_id = ? and comfort_id = ?" , room_id,comfort_id).count >=  2)
        RoomComfort.where("room_id = ? and  comfort_id = ?" , room_id,comfort_id).second.delete
        destruir_repetidos(room_id,comfort_id)
      end
    end
    def conteo(type_of_room_id)
      numero = Room.where("type_of_room_id = ?",type_of_room_id).count
    end 
end
