class AccountXEntriesController < ApplicationController
  before_action :set_account_x_entry, only: [:show, :edit, :update, :destroy]
 
  def index
    @account_x_entries = AccountXEntries.all
  end


  # GET /detail_of_cash_movements/1
  # GET /detail_of_cash_movements/1.json
  def show
  end

  # GET /detail_of_cash_movements/new
  def new
    @account_x_entry = AccountXEntries.new
  end

  # GET /detail_of_cash_movements/1/edit
  def edit
  end

  # POST /detail_of_cash_movements
  # POST /detail_of_cash_movements.json
  def create
    @account_x_entry = AccountXEntries.new(account_x_entry_params)

    respond_to do |format|
      if @account_x_entry.save
        format.html { redirect_to @account_x_entry, notice: 'Detail of cash movement was successfully created.' }
        format.json { render :show, status: :created, location: @account_x_entry }
      else
        format.html { render :new }
        format.json { render json: @account_x_entry.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @account_x_entry.update(account_x_entry_params)
        format.html { redirect_to @account_x_entry, notice: 'Detail of cash movement was successfully updated.' }
        format.json { render :show, status: :ok, location: @account_x_entry }
      else
        format.html { render :edit }
        format.json { render json: @account_x_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /detail_of_cash_movements/1
  # DELETE /detail_of_cash_movements/1.json
  def destroy
    @account_x_entry.destroy
    respond_to do |format|
      format.html { redirect_to account_x_entry_url, notice: 'Detail of cash movement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account_x_entry
      @account_x_entry = AccountXEntries.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_x_entry_params
      params.require(:account_x_entry).permit(:accounting_entry_id,:account, :monto,:observacion,:tipo)
    end
end
