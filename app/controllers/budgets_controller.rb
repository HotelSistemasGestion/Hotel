class BudgetsController < ApplicationController
  before_action :set_budget, only: [:show, :edit, :update, :destroy]


 
   helper_method :hay_disponible



   def hay_disponible()
    cantidad = Integer(params[:cantidad])
    type_of_room_id= params[:type_of_room_id]
    comfort_id = params[:comfort_id]
    check_in = params[:check_in]
    check_out = params[:check_out]

    @result
    count = 0 
    #Primero miro si hay suficientes habitaciones con lo requerido que su estado sea "Libre"
    room= Room.where(["type_of_room_id = ? and comfort_id = ? and state_id = ?", type_of_room_id,comfort_id,1])
    #Si hay,retorno true
    count = room.count

    if count >= cantidad
      @result={"result": true}
      render json: @result.to_json
      #Se acaba la funcion por que ya comprobe que hay habitaciones disponible
      return true
    end
    #Si no hay ninguna "Libre",debemos buscar en las reservadas si esta disponible en nuestro rango de fechas.
    #Buscamos las habitaciones reservadas.
    room_ids= Room.where(["type_of_room_id = ? and comfort_id = ? and state_id != ? and state_id != ?", type_of_room_id,comfort_id,1,4]).select("id")
    #Sacamos las reservaciones de habitaciones que ahora estan en estado reservada.
    if cantidad > (room_ids.count + count)
      @result={"result": false}
      render json: @result.to_json
      return false
    end 
    #debe buscar en reservation room 
    for i in 0..room_ids.length-1
      filter=ReservationRoom.where("room_id = ?",room_ids[i])
      j = 0
      choque = false
      while (j < filter.length and choque == false)
        Rails.logger.debug " j: #{j}"
        Rails.logger.debug " conteo: #{filter[j].check_in.to_s}"
        #pregunto si se superponen las fechas
        #si no se superponene,siginifica que tengo disponible esa fecha.
        (filter[j].check_in.to_s..filter[j].check_out.to_s).overlaps?(check_in.to_date.to_s..check_out.to_date.to_s) ? (choque = true) : (j = j + 1)  
      end
      if j == filter.length
        count = count + 1
      end
    end


    Rails.logger.debug " cantidad: #{count}"

    if cantidad <= count
      @result = {"result": true}
      render json: @result.to_json
      return true
    else   
    @result={"result": false}
      respond_to do |format|
        format.json { render json: @result.to_json }
      end
    return false
    end
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
    #busco los servicios en los detalles de este presupuesto y retorno su id
    @services_details=@budget.budget_service_details.select("service_id").collect(&:service_id)
    #retorno los nombre de los servicios
    @service_name=Service.where("id": @services_details).pluck(:nombre,:precio)
  else
    @budget = Budget.new
  end 

    
  end

  # GET /budgets/1/edit
  def edit
    @my_budget = Budget.find(params[:id])
    @my_reservation_requests = ReservationRequest.find(params[:id])
    #busco los servicios en los detalles de este presupuesto y retorno su id
    @services_details=@budget.budget_service_details.select("service_id").collect(&:service_id)
    #retorno los nombre de los servicios
    @service_name=Service.where("id": @services_details).pluck(:nombre,:precio)
    #busco los tipos de habitaciones en los detalles de este presupuesto y retorno su id
    @room_details=@budget.budget_room_details.select("type_of_room_id").collect(&:type_of_room_id)
    #retorno los nombre de los servicios
    @room_name=TypeOfRoom.where("id": @room_details).pluck(:tipo,:precio)
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
      else
        @my_reservation_requests = ReservationRequest.find(budget_params[:reservation_request_id])
        Rails.logger.debug " conteo: #{1}"
        @budget.budget_service_details.build
        @budget.budget_room_details.build
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
        format.html { redirect_to reservation_requests_path, notice: 'Presupuesto modificado exitosamente.' }
      else
        @my_reservation_requests = ReservationRequest.find(budget_params[:reservation_request_id])
        @my_budget = Budget.find(params[:id])
        @services_details=@my_budget.budget_service_details
        @budget.budget_service_details.build
        @budget.budget_room_details.build
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
