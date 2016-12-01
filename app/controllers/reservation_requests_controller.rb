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
    @reservation_requests = ReservationRequest.all.order(created_at: :desc)
    #@reservation_requests = Kaminari.paginate_array(@reservation_requests).page(params[:page]).per(5)
    @filterrific = initialize_filterrific(
    ReservationRequest,
    params[:filterrific],
     persistence_id: false
    ) or return

    @reservation_requests = @filterrific.find.page(params[:page]).paginate(:per_page => 5, :page => params[:page])
    respond_to do |format|
      format.html
      format.js
    end
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
    range_date = reservation_request_params[:date_range].split('-')
    @reservation_request.check_in = range_date[0]
    @reservation_request.check_out = range_date[1]

    
    respond_to do |format|
       if verify_recaptcha(model: @reservation_request) && @reservation_request.save
       #if @reservation_request.save
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

  def report
  @filterrific = initialize_filterrific(
    ReservationRequest,
    params[:filterrific],select_options: {
        sorted_by_state: ReservationRequest.options_for_sorted_by_state
      },
     persistence_id: false
  ) or return

  @reservation_requests = @filterrific.find.page(params[:page]).paginate(:per_page => 5, :page => params[:page])
  @reservation_requests_report = @filterrific.find
  respond_to do |format|
    format.html
    format.js
  end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation_request
      @reservation_request = ReservationRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation_request_params
      params.require(:reservation_request).permit(:nombre, :apellido, :email, :telefono,:comfort_id, :cantidad_de_adultos, :cantidad_de_ninhos, :cantidad_de_familias, :date_range, :comentarios)
    end
end
