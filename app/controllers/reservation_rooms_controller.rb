class ReservationRoomsController < ApplicationController
  before_action :set_reservation_room, only: [:show, :edit, :update, :destroy]

  # GET /reservation_rooms
  # GET /reservation_rooms.json
  def index
    @reservation_rooms = ReservationRoom.all
  end

  # GET /reservation_rooms/1
  # GET /reservation_rooms/1.json
  def show
  end

  # GET /reservation_rooms/new
  def new
    @reservation_room = ReservationRoom.new
  end

  # GET /reservation_rooms/1/edit
  def edit
  end

  # POST /reservation_rooms
  # POST /reservation_rooms.json
  def create
    @reservation_room = ReservationRoom.new(reservation_room_params)

    respond_to do |format|
      if @reservation_room.save
        format.html { redirect_to @reservation_room, notice: 'Reservation room was successfully created.' }
        format.json { render :show, status: :created, location: @reservation_room }
        @inicio = Budget.where("#{:id} = ?",@reservation_room.budget_id );
        @reservation_room.update({:start =>@inicio.check_in, :end => @incio.check_out})
      else
        format.html { render :new }
        format.json { render json: @reservation_room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reservation_rooms/1
  # PATCH/PUT /reservation_rooms/1.json
  def update
    respond_to do |format|
      if @reservation_room.update(reservation_room_params)
        format.html { redirect_to @reservation_room, notice: 'Reservation room was successfully updated.' }
        format.json { render :show, status: :ok, location: @reservation_room }
      else
        format.html { render :edit }
        format.json { render json: @reservation_room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservation_rooms/1
  # DELETE /reservation_rooms/1.json
  def destroy
    @reservation_room.destroy
    respond_to do |format|
      format.html { redirect_to reservation_rooms_url, notice: 'Reservation room was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation_room
      @reservation_room = ReservationRoom.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation_room_params
      params.require(:reservation_room).permit(:reservation_id, :room_id,:type_of_room_id,
        :comfort_id,:check_in,:check_out, :subtotal,:start,:end,:title,:texColor,:color)
    end
end
