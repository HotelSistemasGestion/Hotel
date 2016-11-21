class AccountPlansController < ApplicationController
  before_action :set_account_plan, only: [:show, :edit, :update, :destroy]

  # GET /account_plans
  # GET /account_plans.json
  def index
    @account_plans = AccountPlan.all
    @accounting_years=AccountingYear.all
  end

  # GET /account_plans/1
  # GET /account_plans/1.json
  def show
    @account = AccountPlan.find(params[:id])
    @accounting_years=AccountingYear.where("account_plan_id = ?" ,params[:id])

    respond_to do |format|
      format.js
    end

  end

  # GET /account_plans/new
  def new
    @account_plan = AccountPlan.new
    @account_plan.accounting_years.build()
  end

  # GET /account_plans/1/edit
  def edit
  end

  # POST /account_plans
  # POST /account_plans.json
  def create
    @account_plan = AccountPlan.new(account_plan_params)

    respond_to do |format|
      if @account_plan.save
        format.html { redirect_to account_plans_path, notice: 'El plan ha sido agregado con exito' }
        format.json { render :show, status: :created, location: @account_plan }
      else
        format.html { render :new }
        format.json { render json: @account_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /account_plans/1
  # PATCH/PUT /account_plans/1.json
  def update
    respond_to do |format|
      if @account_plan.update(account_plan_params)
        format.html { redirect_to account_plans_path, notice: 'El plan de cuentas ha sido actualizado.' }
        format.json { render :show, status: :ok, location: @account_plan }
      else
        format.html { render :edit }
        format.json { render json: @account_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /account_plans/1
  # DELETE /account_plans/1.json
  def destroy
    
    @account_plan.destroy
    respond_to do |format|
      format.html { redirect_to account_plans_path, notice: 'El plan ha sido eliminado correctamente!! ' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account_plan
      @account_plan = AccountPlan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_plan_params
      params.require(:account_plan).permit(:id ,:descripcion, :estado, :version ,:accounting_years_attributes => [:id, :anho,:estado ,:_destroy])
    end
end
