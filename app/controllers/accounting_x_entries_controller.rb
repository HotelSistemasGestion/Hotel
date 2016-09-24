class AccountingXEntriesController < ApplicationController
  before_action :set_accounting_x_entry, only: [:show, :edit, :update, :destroy]

  # GET /accounting_x_entries
  # GET /accounting_x_entries.json
  def index
    @accounting_x_entries = AccountingXEntry.all
  end

  # GET /accounting_x_entries/1
  # GET /accounting_x_entries/1.json
  def show
  end

  # GET /accounting_x_entries/new
  def new
    @accounting_x_entry = AccountingXEntry.new
  end

  # GET /accounting_x_entries/1/edit
  def edit
  end

  # POST /accounting_x_entries
  # POST /accounting_x_entries.json
  def create
    @accounting_x_entry = AccountingXEntry.new(accounting_x_entry_params)

    respond_to do |format|
      if @accounting_x_entry.save
        format.html { redirect_to @accounting_x_entry, notice: 'Accounting x entry was successfully created.' }
        format.json { render :show, status: :created, location: @accounting_x_entry }
      else
        format.html { render :new }
        format.json { render json: @accounting_x_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accounting_x_entries/1
  # PATCH/PUT /accounting_x_entries/1.json
  def update
    respond_to do |format|
      if @accounting_x_entry.update(accounting_x_entry_params)
        format.html { redirect_to @accounting_x_entry, notice: 'Accounting x entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @accounting_x_entry }
      else
        format.html { render :edit }
        format.json { render json: @accounting_x_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounting_x_entries/1
  # DELETE /accounting_x_entries/1.json
  def destroy
    @accounting_x_entry.destroy
    respond_to do |format|
      format.html { redirect_to accounting_x_entries_url, notice: 'Accounting x entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_accounting_x_entry
      @accounting_x_entry = AccountingXEntry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def accounting_x_entry_params
      params.require(:accounting_x_entry).permit(:monto, :observacion)
    end
end
