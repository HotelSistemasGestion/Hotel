class AccountingEntriesController < ApplicationController
  before_action :set_accounting_entry, only: [:show, :edit, :update, :destroy]

  # GET /accounting_entries
  # GET /accounting_entries.json
  def index
    @accounting_entries = AccountingEntry.all.order(numero: :asc)
    @account_x_entries=AccountXEntry.all
  end

  # GET /accounting_entries/1
  # GET /accounting_entries/1.json
  def show
    @accounting_entry = AccountingEntry.find(params[:id])
    @account_x_entry=AccountXEntry.all.where("accounting_entry_id = ?" ,params[:id])
    respond_to do |format|
    format.js
  end
end

  # GET /accounting_entries/new
  def new
    @accounting_entry = AccountingEntry.new
    @accounting_entry.account_x_entries.build()
  end

  # GET /accounting_entries/1/edit
  def edit
  end

  # POST /accounting_entries
  # POST /accounting_entries.json
  def create
    @accounting_entry = AccountingEntry.new(accounting_entry_params)
    #@accounting_entry.cuenta="hola"
    respond_to do |format|
      if @accounting_entry.save
        
        format.html { redirect_to accounting_entries_path, notice: 'El asiento ha sido agregado con exito' }
        format.json { render :show, status: :created, location: @accounting_entry }
      else
        format.html { render :new }
        format.json { render json: @accounting_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  
  # PATCH/PUT /accounting_entries/1
  # PATCH/PUT /accounting_entries/1.json
  def update
    respond_to do |format|
      if @accounting_entry.update(accounting_entry_params)
        format.html { redirect_to @accounting_entry, notice: 'Se ha actualizado con exito.' }
        format.json { render :show, status: :ok, location: @accounting_entry }
      else
        format.html { render :edit }
        format.json { render json: @accounting_entry.errors, status: :unprocessable_entity }
      end
    end
  end



  # DELETE /accounting_entries/1
  # DELETE /accounting_entries/1.json
  def destroy
    @accounting_entry.destroy
    respond_to do |format|
      format.html { redirect_to accounting_entries_url, notice: 'Se ha eliminado con exito!.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_accounting_entry
      @accounting_entry = AccountingEntry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def accounting_entry_params
      params.require(:accounting_entry).permit(:numero, :fecha, :iva, :debe, :haber,:account_x_entries_attributes => [:id, :account,:monto,:observacion,:tipo,:_destroy])
    end
end
