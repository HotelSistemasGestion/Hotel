class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]

  # GET /reservations
  # GET /reservations.json
  def index
    @reservations = Reservation.all
    @reservations = Kaminari.paginate_array(@reservations).page(params[:page]).per(8)
  end

  # GET /reservations/1
  # GET /reservations/1.json
  def show
  end

  # GET /reservations/new
  def new
    if params[:id]
      @reservation = Reservation.new
      @my_reservation_requests = ReservationRequest.find(params[:id])
      @reservation.reservation_rooms.build()
      #@my_type_of_rooms =  TypeOfRoom.find(params[:id])
      @my_budgets = Budget.where("reservation_request_id = ?" ,@my_reservation_requests.id).first
    else
      @reservation = Reservation.new
    end
    

  end

  def my_new
    @reservation = Reservation.new
    @my_reservation_requests = ReservationRequest.find(params[:id])
    @reservation.reservation_rooms.build()
    #@reservation.budget_room_details.build()
    #@my_type_of_rooms =  TypeOfRoom.find(params[:id])
    @my_budgets = Budget.find(params[:id])
  end

  # GET /reservations/1/edit
  def edit
    @reservation = Reservation.find(params[:id])
    @my_reservation_requests = ReservationRequest.find(params[:id])
  end

  # POST /reservations
  # POST /reservations.json
  def create
    @reservation = Reservation.new(reservation_params) 
    respond_to do |format|
      if @reservation.save
        format.html { redirect_to reservations_path(), notice: 'Reservacion creada exitosamente.' }
        #format.json { render :show, status: :created, location: @reservation }
      else
        @my_reservation_requests = ReservationRequest.find(reservation_params[:reservation_request_id])
        #@reservation.reservation_requests.build()
        @reservation.reservation_rooms.build()
        @my_budgets = Budget.find(params[:budget_id])
        format.html { render :new }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end



  # PATCH/PUT /reservations/1
  # PATCH/PUT /reservations/1.json
  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to @reservation, notice: 'Reservation was successfully updated.' }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1
  # DELETE /reservations/1.json
  def destroy
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to reservations_url, notice: 'Reservation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation_params
     # params.require(:reservation).permit(:nombre, :apellido, :check_in, :check_out, :type_of_room_id)
     #json.extract! reservation, :id, :nombre, :apellido, :check_in, :check_out, :type_of_room_id, :created_at, :updated_at
     #json.url reservation_url(reservation, format: :json)
     params.require(:reservation).permit(:id, :reservation_request_id, :budget_id, :nombre, :apellido, :email, :dias, :check_in, :check_out, :room_id, :type_of_room_id, :total,
      :reservation_rooms_attributes => [:id, :cantidad,:reservation_id,:room_id, :type_of_room,:budget, :subtotal, :_destroy],
      :reservation_requests_attributes => [:id, :nombre, :apellido, :email, :telefono,:comfort_id, :cantidad_de_adultos, :cantidad_de_ninhos, :cantidad_de_familias, 
        :check_in, :check_out, :comentarios, :_destroy])
    end
end
