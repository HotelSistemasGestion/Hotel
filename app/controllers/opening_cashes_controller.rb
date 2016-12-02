class OpeningCashesController < ApplicationController
  before_action :authenticate_user!  
  load_and_authorize_resource
  before_action :set_opening_cash, only: [:show, :edit, :update, :destroy]

  # GET /opening_cashes
  # GET /opening_cashes.json
  def index
    @opening_cashes = OpeningCash.all.order(estado: :desc)
    #@opening_cashes = Kaminari.paginate_array(@opening_cashes).page(params[:page]).per(5)
     @filterrific = initialize_filterrific(
    OpeningCash,
    params[:filterrific],
     persistence_id: false
    ) or return

    @opening_cashes = @filterrific.find.page(params[:page]).paginate(:per_page => 5, :page => params[:page])
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /opening_cashes/1
  # GET /opening_cashes/1.json
  def show

  end

  # GET /opening_cashes/new
  def new
    @opening_cash = OpeningCash.new
  end

  def my_new
    @opening_cash = OpeningCash.new
    @my_cashes = Cash.find(params[:cash_id])
  end
  # GET /opening_cashes/1/edit
  def edit
  end

  # POST /opening_cashes
  # POST /opening_cashes.json
  def create
    @opening_cash = OpeningCash.new(opening_cash_params) 
    employee = Employee.find(@opening_cash.employee_id)
    respond_to do |format|
      @opening_cash.estado = "Activo"
      @opening_cash.final_efectivo = 0
      @opening_cash.final_cheque = 0
      @opening_cash.final_credito = 0
      @opening_cash.final_debito = 0
      if @opening_cash.save
        cash=Cash.find(@opening_cash.cash_id)
        cash.estado="Abierta"
        cash.save
        employee.estado = "Ocupado"
        employee.save
        format.html { redirect_to opening_cashes_url}
        format.json { render :show, status: :created, location: @opening_cash }
      else
        format.html { render :new }
        format.json { render json: @opening_cash.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /opening_cashes/1
  # PATCH/PUT /opening_cashes/1.json
  def update
    respond_to do |format|
      if @opening_cash.update(opening_cash_params)
        format.html { redirect_to @opening_cash, notice: 'Opening cash was successfully updated.' }
        format.json { render :show, status: :ok, location: @opening_cash }
      else
        format.html { render :edit }
        format.json { render json: @opening_cash.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /opening_cashes/1
  # DELETE /opening_cashes/1.json
  def destroy
    @opening_cash.destroy
    respond_to do |format|
      format.html { redirect_to opening_cashes_url, notice: 'Opening cash was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_opening_cash
      @opening_cash = OpeningCash.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def opening_cash_params
      params.require(:opening_cash).permit(:id, :fecha_apertura, :monto_efectivo, :cash_id, :employee_id)
    end
end
