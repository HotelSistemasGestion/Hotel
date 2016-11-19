class AccountingYearsController < ApplicationController
  before_action :set_accounting_year, only: [:show, :edit, :update, :destroy]
  def index
    @accounting_years = AccountingYear.all
  end

  # GET /detail_of_cash_movements/1
  # GET /detail_of_cash_movements/1.json
  def show
  end

  # GET /detail_of_cash_movements/new
  def new
    @accounting_year = AccountingYear.new
  end

  # GET /detail_of_cash_movements/1/edit
  def edit
  end

  # POST /detail_of_cash_movements
  # POST /detail_of_cash_movements.json
  def create
    @accounting_year = AccountingYear.new(accounting_year_params)

    respond_to do |format|
      if @accounting_year.save
        format.html { redirect_to @accounting_year, notice: 'Detail of cash movement was successfully created.' }
        format.json { render :show, status: :created, location: @accounting_year }
      else
        format.html { render :new }
        format.json { render json: @accounting_year.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @accounting_year.update(accounting_year_params)
        format.html { redirect_to @accounting_year, notice: 'Detail of cash movement was successfully updated.' }
        format.json { render :show, status: :ok, location: @accounting_year }
      else
        format.html { render :edit }
        format.json { render json: @accounting_year.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /detail_of_cash_movements/1
  # DELETE /detail_of_cash_movements/1.json
  def destroy
    @accounting_year.destroy
    respond_to do |format|
      format.html { redirect_to accounting_year_url, notice: 'Detail of cash movement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_accounting_year
      @accounting_year = AccountingYear.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def accounting_year_params
      params.require(:accounting_year).permit( :account_plan_id,:anho, :estado)
    end
end
