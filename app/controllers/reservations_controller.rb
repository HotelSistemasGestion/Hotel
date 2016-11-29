class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]

  # GET /reservations
  # GET /reservations.json
  def index
    @reservations = Reservation.all
    @filterrific = initialize_filterrific(
    Reservation,
    params[:filterrific],
     persistence_id: false
    ) or return

    @reservations = @filterrific.find.page(params[:page]).paginate(:per_page => 2, :page => params[:page])
    respond_to do |format|
      format.html
      format.js
    end
  end

  #Encargado de llenar el dropdown de habitaciones en reservations
  def habitaciones
    type_of_room_id= Integer(params[:type_of_room_id])
    comfort_id = Integer( params[:comfort_id])
    @habitaciones = Room.where("type_of_room_id = ? and comfort_id = ?",type_of_room_id,comfort_id)
    render json: @habitaciones
  end

  #encargado de decir si esta disponible la habitacion
  def hay_disponible
    room_id = Integer(params[:room_id])
    check_in = params[:check_in]
    check_out = params[:check_out]

    @result
    count = 0 
    #Primero miro si esa habitacion su estado sea "Libre"
    room= Room.where(["id = ? and state_id = ?",room_id,1])
    #Si hay,retorno true
    if room.any?
      @result={"result": true}
      render json: @result.to_json 
      #Se acaba la funcion por que ya comprobe que hay una habitacion disponible
      return true
    end
    #Si no hay suficientes "Libre",debemos buscar en las reservadas si esta disponible en nuestro rango de fechas.
    #Buscamos las habitaciones reservadas.
    ##room_ids= Room.where(["room_id = ? and state_id != ? and state_id != ?",room_id,1,4]).select("id")
    #Buscamos esa habitacion entre las reservaciones,y vemos si tenemos esa fecha libre
    filter=ReservationRoom.where(room_id:room_id)
    for i in 0..filter.length-1
      #pregunto si se superponen las fechas
     if !(filter[i].check_in.to_s..filter[i].check_out.to_s).overlaps?(check_in.to_date.to_s..check_out.to_date.to_s)
      @result={"result": true}
      render json: @result.to_json 
      return true
     end
    end
    @result={"result": false}
    render json: @result.to_json
    return false
  end

  # GET /reservations/1
  # GET /reservations/1.json
  def show
  end

  # GET /reservations/new
  def new
    if params[:id]
      #construimos el la reservacion cuando apretamos confirmar
      @my_reservation_requests = ReservationRequest.find(params[:id])
      @my_budgets = Budget.where("reservation_request_id = ?", @my_reservation_requests.id).first
      @reservation = Reservation.new(nombre: @my_reservation_requests.nombre,apellido: @my_reservation_requests.apellido,telefono: @my_reservation_requests.telefono,email: @my_reservation_requests.email)
      iterar = @my_budgets.budget_room_details
      iterar.each do |budget_room_detail|
        (1..budget_room_detail.cantidad).each do |r|
          @reservation.reservation_rooms.new(type_of_room_id: budget_room_detail.type_of_room_id,comfort_id:@my_budgets.comfort_id,check_in:@my_budgets.check_in.strftime("%d-%m-%Y"),check_out:@my_budgets.check_out.strftime("%d-%m-%Y"),subtotal: budget_room_detail.subtotal)
        end
      end

    @reservation.reservation_rooms.build()
    #@my_type_of_rooms =  TypeOfRoom.find(params[:id])      
    else 
      @reservation = Reservation.new
      @reservation.reservation_rooms.build()
    end

  end

  def my_new
    @reservation = Reservation.new
    @reservation.reservation_rooms.build()
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
        #@my_reservation_requests = ReservationRequest.find(reservation_params[:reservation_request_id])
        #@reservation.reservation_requests.build()
        @reservation.reservation_rooms.build() 
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
        format.html { redirect_to reservations_path(), notice: 'Reservacion actualizada.'}
        #format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1
  # DELETE /reservations/1.json
  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
   
   respond_to do |format|
      format.html { redirect_to reservations_url }
      format.json { head :no_content }
      format.js   { render :layout => false }
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
     params.require(:reservation).permit(:id, :budget_id, :nombre, :apellido, :email, :telefono, :total,
      :reservation_rooms_attributes => [:id, :type_of_room_id,:comfort_id,:room_id,:check_in,:check_out, :subtotal, :_destroy])

    end
end
