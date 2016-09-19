class ReservationRequestsController < ApplicationController
  before_action :set_reservation_request, only: [:show, :edit, :update, :destroy]

  # GET /reservation_requests
  # GET /reservation_requests.json
  def index
    @reservation_requests = ReservationRequest.all
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
    @reservation_request = ReservationRequest.new(reservation_request_params)

    respond_to do |format|
      if @reservation_request.save
        format.html { redirect_to @reservation_request, notice: 'Reservation request was successfully created.' }
        format.json { render :show, status: :created, location: @reservation_request }
      else
        format.html { render :new }
        format.json { render json: @reservation_request.errors, status: :unprocessable_entity }
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
      params.require(:reservation_request).permit(:nombre, :apellido, :email, :telefono, :cantidad_de_adultos, :cantidad_de_ninhos, :cantidad_de_familias, :check_in, :check_out, :comentarios)
    end
end
