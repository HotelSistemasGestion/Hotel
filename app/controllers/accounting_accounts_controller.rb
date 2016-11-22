class AccountingAccountsController < ApplicationController
  before_action :set_accounting_account, only: [:show, :edit, :update, :destroy]

  autocomplete :accounting_year, :anho ,:display_value => :estado ,:extra_data => [:id, :anho, :estado]

  # GET /accounting_accounts
  # GET /accounting_accounts.json
  def index
    
    #@accounting_accounts = AccountingAccount.all.order(:grupo)
    #@accounting_accounts = AccountingAccount.all.order(grupo: :desc)
    @accounting_years=AccountingYear.all.order(anho: :asc)
    @year=AccountingYear.find_by(estado: "vigente")
    @id=@year.id
    @accounting_accounts = AccountingAccount.where(ejercicio: @id).order(grupo: :asc)
  end

  # GET /accounting_accounts/1
  # GET /accounting_accounts/1.json
  def show
    @accounting_account = AccountingAccount.find(params[:id])
    

    respond_to do |format|
      format.js{}
    end
  end

def accountiong_account_years
      #accounting_year_id = params[:accounting_year_id]
      #@accounting_year= AccountingYear.where("id = ?" ,accounting_year_id)

      #@accountplan=AccountPlan.find(1)

      #@account_x_plan=AccountXPlan.where("account_plan_id = ?" ,1)

      @accounts = AccountingAccount.where(ejercicio: params[:accounting_year_id]).order(grupo: :asc)
      respond_to do |format|
        format.js
      end
  end
  # GET /accounting_accounts/new
  

  def new
  @accounting_account = AccountingAccount.new
  end

  # GET /accounting_accounts/1/edit
  def edit
  end

  # POST /accounting_accounts
  # POST /accounting_accounts.json
  def create
    @accounting_account = AccountingAccount.new(accounting_account_params)
        respond_to do |format|
      if @accounting_account.save
        account_year = AccountingYear.find(@accounting_account.ejercicio)
    account_plan = account_year.account_plan_id
    cuentas_x_plan = AccountXPlan.new
    cuentas_x_plan.account_plan_id=account_plan
    cuentas_x_plan.accounting_account_id=@accounting_account.id
    cuentas_x_plan.cuenta_superior=@accounting_account.grupo
    cuentas_x_plan.save              

        format.html { redirect_to accounting_accounts_path, notice: 'La cuenta ha sido agregada con exito' }
        format.json { render :show, status: :created, location: @accounting_account }
      else
        format.html { render :new }
        format.json { render json: @accounting_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accounting_accounts/1
  # PATCH/PUT /accounting_accounts/1.json
  def update
    respond_to do |format|
      if @accounting_account.update(accounting_account_params)
        format.js { }
      else
        format.html { render :edit }
        format.json { render json: @accounting_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounting_accounts/1
  # DELETE /accounting_accounts/1.json
  def destroy
    @accounting_account.destroy
    respond_to do |format|
      format.html { redirect_to accounting_accounts_url, notice: 'La cuenta ha sido eliminada.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_accounting_account
      @accounting_account = AccountingAccount.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def accounting_account_params
      params.require(:accounting_account).permit(:grupo, :nombre, :imputable,:cuenta,:ejercicio)
    end
end
