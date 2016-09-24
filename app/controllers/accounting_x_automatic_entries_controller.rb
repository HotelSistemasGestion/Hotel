class AccountingXAutomaticEntriesController < ApplicationController
  before_action :set_accounting_x_automatic_entry, only: [:show, :edit, :update, :destroy]

  # GET /accounting_x_automatic_entries
  # GET /accounting_x_automatic_entries.json
  def index
    @accounting_x_automatic_entries = AccountingXAutomaticEntry.all
  end

  # GET /accounting_x_automatic_entries/1
  # GET /accounting_x_automatic_entries/1.json
  def show
  end

  # GET /accounting_x_automatic_entries/new
  def new
    @accounting_x_automatic_entry = AccountingXAutomaticEntry.new
  end

  # GET /accounting_x_automatic_entries/1/edit
  def edit
  end

  # POST /accounting_x_automatic_entries
  # POST /accounting_x_automatic_entries.json
  def create
    @accounting_x_automatic_entry = AccountingXAutomaticEntry.new(accounting_x_automatic_entry_params)

    respond_to do |format|
      if @accounting_x_automatic_entry.save
        format.html { redirect_to @accounting_x_automatic_entry, notice: 'Accounting x automatic entry was successfully created.' }
        format.json { render :show, status: :created, location: @accounting_x_automatic_entry }
      else
        format.html { render :new }
        format.json { render json: @accounting_x_automatic_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accounting_x_automatic_entries/1
  # PATCH/PUT /accounting_x_automatic_entries/1.json
  def update
    respond_to do |format|
      if @accounting_x_automatic_entry.update(accounting_x_automatic_entry_params)
        format.html { redirect_to @accounting_x_automatic_entry, notice: 'Accounting x automatic entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @accounting_x_automatic_entry }
      else
        format.html { render :edit }
        format.json { render json: @accounting_x_automatic_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounting_x_automatic_entries/1
  # DELETE /accounting_x_automatic_entries/1.json
  def destroy
    @accounting_x_automatic_entry.destroy
    respond_to do |format|
      format.html { redirect_to accounting_x_automatic_entries_url, notice: 'Accounting x automatic entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_accounting_x_automatic_entry
      @accounting_x_automatic_entry = AccountingXAutomaticEntry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def accounting_x_automatic_entry_params
      params.fetch(:accounting_x_automatic_entry, {})
    end
end
