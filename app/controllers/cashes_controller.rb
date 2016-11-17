class CashesController < ApplicationController
  
  before_action :authenticate_user!
  before_action :set_cash, only: [:show, :edit, :update, :destroy]

  # GET /cashes
  # GET /cashes.json
  def index
    @cashes = Cash.all
  end

  # GET /cashes/1
  # GET /cashes/1.json
  def show
     @cash = Cash.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  # GET /cashes/new
  def new
    @cash = Cash.new
  end

  # GET /cashes/1/edit
  def edit
  end

  # POST /cashes
  # POST /cashes.json
  def create
    @cash = Cash.new(cash_params)
    @cash.estado = "Cerrada" 
    respond_to do |format|
      if @cash.save
        format.js { } # Hace un render a create.js.erb
      else
        format.html { render :new }
        format.json { render json: @cash.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cashes/1
  # PATCH/PUT /cashes/1.json
  def update
    respond_to do |format|
      if @cash.update(cash_params)
        format.js { }
      else
        format.html { render :edit }
        format.json { render json: @cash.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cashes/1
  # DELETE /cashes/1.json
  def destroy
    @cash.destroy
    respond_to do |format|
      format.html { redirect_to cashes_url, notice: 'Cash was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cash
      @cash = Cash.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cash_params
      params.require(:cash).permit(:descripcion)
    end
end
