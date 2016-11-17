class BudgetsController < ApplicationController
  before_action :set_budget, only: [:show, :edit, :update, :destroy]


 
   helper_method :hay_disponible



   def hay_disponible(cantidad,type_of_room_id,comfort_id,check_in,check_out)
    count = 0 
    #Primero miro si hay alguna habitacion con lo requerido que su estado sea "Libre"
    room= Room.where(["type_of_room_id = ? and state_id = ?", type_of_room_id,1])
    #Si hay,retorno true
    count=room.count
    if count >= cantidad
      return true
      #Se acaba la funcion por que ya comprobe que hay una habitacion disponible
    end
    #Si no hay ninguna "Libre",debemos buscar en las reservadas si esta disponible en nuestro rango de fechas.
    #Buscamos las habitaciones reservadas.
    room_ids= Room.where(["type_of_room_id = ? and state_id != ? and state_id != ?", type_of_room_id,1,4]).select("id")
    #Sacamos las reservaciones de habitaciones que ahora estan en estado reservada.
    filter=Reservation.where(room_id:room_ids)
    for i in 0..filter.length-1
      #pregunto si se superponen las fechas
     if !(filter[i].check_in.to_s..filter[i].check_out.to_s).overlaps?(check_in..check_out)
      count=count+1
     end
     if count >= cantidad
      return true
     end
    end
    return false
  end

  # GET /budgets
  # GET /budgets.json
  def index
    @budgets = Budget.all
  end

  # GET /budgets/1
  # GET /budgets/1.json
  def show
  end

  # GET /budgets/new
  def new
  if params[:id]
    @budget = Budget.new
    @budget.budget_service_details.build()
    @budget.budget_room_details.build()
    @my_reservation_requests = ReservationRequest.find(params[:id])
  else
    @budget = Budget.new
  end 

    
  end

  def my_new
    @budget = Budget.new
    @budget.budget_service_details.build()
    @my_reservation_requests = ReservationRequest.find(params[:id])
  end
  # GET /budgets/1/edit
  def edit
    @my_budget = Budget.find(params[:id])
    @my_reservation_requests = ReservationRequest.find(params[:id])


  end

  # POST /budgets
  # POST /budgets.json
  def create
    @budget = Budget.new(budget_params)
    @budget1 =  @budget
    respond_to do |format|
      if @budget.save
        BudgetMailer.budget_email(@budget1).deliver_now
        format.html { redirect_to reservation_requests_path, notice: 'Presupuesto creado exitosamente.' }
        #format.html { redirect_to reservations_path(), notice: 'Reservacion creada exitosamente.' }
        #format.json { render :index, status: :created, location: @budget }
      else
        @my_reservation_requests = ReservationRequest.find(budget_params[:reservation_request_id])
        @budget.budget_service_details.build()
        @budget.budget_room_details.build()
        format.html { render :new }
        format.json { render json: @budget.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /budgets/1
  # PATCH/PUT /budgets/1.json
  def update
    @budget = Budget.find(params[:id])
    @budget1 =  @budget
    respond_to do |format|
      if @budget.update(budget_params)
        BudgetMailer.budget_email(@budget1).deliver_now
        format.html { redirect_to @budget, notice: 'Budget was successfully updated.' }
        format.json { render :show, status: :ok, location: @budget }
      else
        @my_reservation_requests = ReservationRequest.find(budget_params[:reservation_request_id])
        @my_budget = Budget.find(params[:id])
        format.html { render :edit }
        format.json { render json: @budget.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /budgets/1
  # DELETE /budgets/1.json
  def destroy
    @budget.destroy
    respond_to do |format|
      format.html { redirect_to budgets_url, notice: 'Budget was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_budget
      @budget = Budget.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def budget_params
      params.require(:budget).permit(:id,:reservation_request_id,:comfort_id,:check_in, :check_out,:comentario, :descuento, :total,:budget_room_details_attributes => [:id, :cantidad, :type_of_room_id, :subtotal, :_destroy], :budget_service_details_attributes => [:id, :cantidad, :service_id, :subtotal, :_destroy])
    end
end
