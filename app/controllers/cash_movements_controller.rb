class CashMovementsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  before_action :set_cash_movement, only: [:show, :edit, :update, :destroy]
  
  # GET /cash_movements
  # GET /cash_movements.json
  def index
    @cash_movements = CashMovement.all
  end

  # GET /cash_movements/1
  # GET /cash_movements/1.json
  def show
  end

  # GET /cash_movements/new
  def new
    @cash_movement = CashMovement.new
    @cash_movement.detail_of_cash_movements.build()
    @cash_movement.payment_types.build()

  end

  def my_new
    @cash_movement = CashMovement.new
    @cash_movement.detail_of_cash_movements.build()
    @cash_movement.payment_types.build()
    @my_openings =OpeningCash.find(params[:opening_cash_id])
  end
  # GET /cash_movements/1/edit
  def edit
  end

  # POST /cash_movements
  # POST /cash_movements.json
  def create
    @cash_movement = CashMovement.new(cash_movement_params)
    respond_to do |format|
      if @cash_movement.save
        format.html { redirect_to @cash_movement, notice: 'Cash movement was successfully created.' }
        format.json { render :show, status: :created, location: @cash_movement }
      else
        format.html { render :new }
        format.json { render json: @cash_movement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cash_movements/1
  # PATCH/PUT /cash_movements/1.json
  def update
    respond_to do |format|
      if @cash_movement.update(cash_movement_params)
        format.html { redirect_to @cash_movement, notice: 'Cash movement was successfully updated.' }
        format.json { render :show, status: :ok, location: @cash_movement }
      else
        format.html { render :edit }
        format.json { render json: @cash_movement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cash_movements/1
  # DELETE /cash_movements/1.json
  def destroy
    @cash_movement.destroy
    respond_to do |format|
      format.html { redirect_to cash_movements_url, notice: 'Cash movement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cash_movement
      @cash_movement = CashMovement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cash_movement_params
      params.require(:cash_movement).permit(:id, :monto_total, :opening_cash_id, :type_of_cash_movement_id , :client_id, :detail_of_cash_movements_attributes => [:id, :sub_monto,:payment_types, :_destroy], :payment_types_attributes =>[:id, :descripcion,:titular,:banco,:n_cheque,:tarjeta_tipo,:fecha_disponibilidad,:_destroy])
    end
end
