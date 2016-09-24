class AccountingYearsController < ApplicationController
  before_action :set_accounting_year, only: [:show, :edit, :update, :destroy]

  # GET /accounting_years
  # GET /accounting_years.json
  def index
    @accounting_years = AccountingYear.all
  end

  # GET /accounting_years/1
  # GET /accounting_years/1.json
  def show
  end

  # GET /accounting_years/new
  def new
    @accounting_year = AccountingYear.new
  end

  # GET /accounting_years/1/edit
  def edit
  end

  # POST /accounting_years
  # POST /accounting_years.json
  def create
    @accounting_year = AccountingYear.new(accounting_year_params)

    respond_to do |format|
      if @accounting_year.save
        format.html { redirect_to @accounting_year, notice: 'Accounting year was successfully created.' }
        format.json { render :show, status: :created, location: @accounting_year }
      else
        format.html { render :new }
        format.json { render json: @accounting_year.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accounting_years/1
  # PATCH/PUT /accounting_years/1.json
  def update
    respond_to do |format|
      if @accounting_year.update(accounting_year_params)
        format.html { redirect_to @accounting_year, notice: 'Accounting year was successfully updated.' }
        format.json { render :show, status: :ok, location: @accounting_year }
      else
        format.html { render :edit }
        format.json { render json: @accounting_year.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounting_years/1
  # DELETE /accounting_years/1.json
  def destroy
    @accounting_year.destroy
    respond_to do |format|
      format.html { redirect_to accounting_years_url, notice: 'Accounting year was successfully destroyed.' }
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
      params.require(:accounting_year).permit(:anho, :estado)
    end
end
