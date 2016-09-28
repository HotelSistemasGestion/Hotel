class DetailOfCashCountsController < ApplicationController
  before_action :set_detail_of_cash_count, only: [:show, :edit, :update, :destroy]

  # GET /detail_of_cash_counts
  # GET /detail_of_cash_counts.json
  def index
    @detail_of_cash_counts = DetailOfCashCount.all
  end

  # GET /detail_of_cash_counts/1
  # GET /detail_of_cash_counts/1.json
  def show
  end

  # GET /detail_of_cash_counts/new
  def new
    @detail_of_cash_count = DetailOfCashCount.new
  end

  # GET /detail_of_cash_counts/1/edit
  def edit
  end

  # POST /detail_of_cash_counts
  # POST /detail_of_cash_counts.json
  def create
    @detail_of_cash_count = DetailOfCashCount.new(detail_of_cash_count_params)

    respond_to do |format|
      if @detail_of_cash_count.save
        format.html { redirect_to @detail_of_cash_count, notice: 'Detail of cash count was successfully created.' }
        format.json { render :show, status: :created, location: @detail_of_cash_count }
      else
        format.html { render :new }
        format.json { render json: @detail_of_cash_count.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /detail_of_cash_counts/1
  # PATCH/PUT /detail_of_cash_counts/1.json
  def update
    respond_to do |format|
      if @detail_of_cash_count.update(detail_of_cash_count_params)
        format.html { redirect_to @detail_of_cash_count, notice: 'Detail of cash count was successfully updated.' }
        format.json { render :show, status: :ok, location: @detail_of_cash_count }
      else
        format.html { render :edit }
        format.json { render json: @detail_of_cash_count.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /detail_of_cash_counts/1
  # DELETE /detail_of_cash_counts/1.json
  def destroy
    @detail_of_cash_count.destroy
    respond_to do |format|
      format.html { redirect_to detail_of_cash_counts_url, notice: 'Detail of cash count was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_detail_of_cash_count
      @detail_of_cash_count = DetailOfCashCount.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def detail_of_cash_count_params
      params.require(:detail_of_cash_count).permit(:monto_sistema, :monto_caja)
    end
end
