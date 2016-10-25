class AccountingAccountsController < ApplicationController
  before_action :set_accounting_account, only: [:show, :edit, :update, :destroy]

  # GET /accounting_accounts
  # GET /accounting_accounts.json
  def index
    @accounting_accounts = AccountingAccount.all
  end

  # GET /accounting_accounts/1
  # GET /accounting_accounts/1.json
  def show
     @accounting = AccountingAccount.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  # GET /accounting_accounts/new
  

  def new
  @accounting = AccountingAccount.new
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
        format.html { redirect_to @accounting_account, notice: 'Accounting account was successfully created.' }
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
      format.html { redirect_to accounting_accounts_url, notice: 'Accounting account was successfully destroyed.' }
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
      params.require(:accounting_account).permit(:grupo, :nombre, :imputable)
    end
end
