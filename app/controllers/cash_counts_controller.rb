class CashCountsController < ApplicationController
  before_action :set_cash_count, only: [:show, :edit, :update, :destroy]

  # GET /cash_counts
  # GET /cash_counts.json
  def index
    @cash_counts = CashCount.all
  end

  # GET /cash_counts/1
  # GET /cash_counts/1.json
  def show
  end

  # GET /cash_counts/new
  def new
    @cash_count = CashCount.new
  end

  # GET /cash_counts/1/edit
  def edit
  end

  # POST /cash_counts
  # POST /cash_counts.json
  def create
    @cash_count = CashCount.new(cash_count_params)

    respond_to do |format|
      if @cash_count.save
        format.html { redirect_to @cash_count, notice: 'Cash count was successfully created.' }
        format.json { render :show, status: :created, location: @cash_count }
      else
        format.html { render :new }
        format.json { render json: @cash_count.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cash_counts/1
  # PATCH/PUT /cash_counts/1.json
  def update
    respond_to do |format|
      if @cash_count.update(cash_count_params)
        format.html { redirect_to @cash_count, notice: 'Cash count was successfully updated.' }
        format.json { render :show, status: :ok, location: @cash_count }
      else
        format.html { render :edit }
        format.json { render json: @cash_count.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cash_counts/1
  # DELETE /cash_counts/1.json
  def destroy
    @cash_count.destroy
    respond_to do |format|
      format.html { redirect_to cash_counts_url, notice: 'Cash count was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cash_count
      @cash_count = CashCount.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cash_count_params
      params.require(:cash_count).permit(:fecha_arqueo)
    end
end
