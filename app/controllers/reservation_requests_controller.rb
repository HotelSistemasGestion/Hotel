class ReservationRequestsController < ApplicationController
  before_action :set_reservation_request, only: [:show, :edit, :update, :destroy]
  helper_method :my_budget



   def my_budget(reservation_request)
    budget = Budget.where("reservation_request_id = ? ",reservation_request).first
    return budget
  end

  # GET /reservation_requests
  # GET /reservation_requests.json
  def index
    #@reservation_requests = ReservationRequest.all.reverse
    @reservation_requests = ReservationRequest.order(created_at: :desc).page params[:page]
  end

  # GET /reservation_requests/1
  # GET /reservation_requests/1.json
  def show
  end

  # GET /reservation_requests/new
  def new
    @reservation_request = ReservationRequest.new
  end

  # GET /reservation_requests/1/edit
  def edit
  end

  # POST /reservation_requests
  # POST /reservation_requests.json
  def create
    @complaint = Complaint.new
    @reservation_request = ReservationRequest.new(reservation_request_params)
    
    respond_to do |format|
       #if verify_recaptcha(model: @reservation_request) && @reservation_request.save
       if @reservation_request.save
        # Redireccionamos a welcome y especificamente a la seccion de contacto para mostrar el mensaje de exito.
        format.html { redirect_to welcome_index_path(), notice: 'Su pedido fue creado con exito,en breve responderemos.' }
        #format.json { render 'welcome/index' , status: :created, location: @reservation_request }
      else
        format.html { render 'welcome/index'}
        format.json { render json: @reservation_request.errors, status: :unprocessable_entity }
        #format.html {redirect_to welcome_index_path(:anchor => 'contact'),json: @reservation_request.errors}
      end
    end
  end

  # PATCH/PUT /reservation_requests/1
  # PATCH/PUT /reservation_requests/1.json
  def update
    respond_to do |format|
      if @reservation_request.update(reservation_request_params)
        format.html { redirect_to @reservation_request, notice: 'Reservation request was successfully updated.' }
        format.json { render :show, status: :ok, location: @reservation_request }
      else
        format.html { render :edit }
        format.json { render json: @reservation_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservation_requests/1
  # DELETE /reservation_requests/1.json
  def destroy
    @reservation_request.destroy
    respond_to do |format|
      format.html { redirect_to reservation_requests_url, notice: 'Reservation request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation_request
      @reservation_request = ReservationRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation_request_params
      params.require(:reservation_request).permit(:nombre, :apellido, :email, :telefono,:comfort_id, :cantidad_de_adultos, :cantidad_de_ninhos, :cantidad_de_familias, :check_in, :check_out, :comentarios)
    end
end
