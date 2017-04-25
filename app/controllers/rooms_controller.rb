class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy]

  autocomplete :room, :identificador, :extra_data => [:id, :type_of_room_id, :state_id]
  

  # GET /rooms
  # GET /rooms.json
  def index
    #@rooms = Room.all
   # @rooms = Room.all.order(created_at: :desc)
    #@rooms = Kaminari.paginate_array(@rooms).page(params[:page]).per(5)
      @filterrific = initialize_filterrific(
    Room,
    params[:filterrific],select_options: {
        sorted_by_type: TypeOfRoom.options_for_sorted_by_type,
        sorted_by_state: State.options_for_sorted_by_state,
        sorted_by_comfort: Comfort.options_for_sorted_by_comfort
      },
     persistence_id: false
  ) or return

  @rooms = @filterrific.find.page(params[:page]).paginate(:per_page => 5, :page => params[:page])
 @rooms_report = @filterrific.find
  respond_to do |format|
    format.html
    format.js
  end
  end

  # GET /rooms/1
  # GET /rooms/1.json
  def show
    #@room_comfort = RoomComfort.where("#{:room_id} = ?", params[:id])
    #@room_comfort.each do |room| 
     # destruir_repetidos(room.room_id,room.comfort_id);
    #end  
    #@room_comforts =RoomComfort.all;
  end

  # GET /rooms/new
  def new
    @room = Room.new
    #@room.room_comforts.build
    @room.photos.build
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
        format.html { redirect_to @room, notice: 'La habitacion ha sido creada correctamente.' }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { render :new }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rooms/1
  # PATCH/PUT /rooms/1.json
  def update
    respond_to do |format|
     # @room_comforts = RoomComfort.all
      if @room.update(room_params)
        #@room_comforts.each do |room| 
        # destruir_repetidos(room.room_id,room.comfort_id);
        #end  
        format.html { redirect_to @room, notice: 'La habitacion ha sido editada correctamente.' }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1
  # DELETE /rooms/1.json
  def destroy
   # @room.destroy
   @room.update({:state_id => 4})
    respond_to do |format|
      format.html { redirect_to rooms_url, notice: 'La habitacion ha sido inhabilitada!!' }
      format.json { head :no_content }
    end
  end

  # metodo utilizado para reporte
  def report
  @filterrific = initialize_filterrific(
    Room,
    params[:filterrific],select_options: {
        sorted_by_type: TypeOfRoom.options_for_sorted_by_type,
        sorted_by_state: State.options_for_sorted_by_state
      },
     persistence_id: false
  ) or return

  @rooms = @filterrific.find.page(params[:page]).paginate(:per_page => 5, :page => params[:page])
  @rooms_report = @filterrific.find
  respond_to do |format|
    format.html
    format.js
  end
  end




  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_params
      params.require(:room).permit(:type_of_room_id, :state_id, :capacidad, :identificador,:comfort_id,:photos_attributes => [:id,:room_id,:my_file,:_destroy])
    end
    #def destruir_repetidos(room_id,comfort_id)
    #  if(RoomComfort.where("room_id = ? and comfort_id = ?" , room_id,comfort_id).count >=  2)
    #    RoomComfort.where("room_id = ? and  comfort_id = ?" , room_id,comfort_id).second.delete
    #    destruir_repetidos(room_id,comfort_id)
    #  end
    #end
end

