class BudgetServiceDetailsController < ApplicationController
  before_action :set_budget_service_detail, only: [:show, :edit, :update, :destroy]

  # GET /budget_service_details
  # GET /budget_service_details.json
  def index
    @budget_service_details = BudgetServiceDetail.all
  end

  # GET /budget_service_details/1
  # GET /budget_service_details/1.json
  def show
  end

  # GET /budget_service_details/new
  def new
    @budget_service_detail = BudgetServiceDetail.new
  end

  # GET /budget_service_details/1/edit
  def edit
  end

  # POST /budget_service_details
  # POST /budget_service_details.json
  def create
    @budget_service_detail = BudgetServiceDetail.new(budget_service_detail_params)

    respond_to do |format|
      if @budget_service_detail.save
        format.html { redirect_to @budget_service_detail, notice: 'Budget service detail was successfully created.' }
        format.json { render :show, status: :created, location: @budget_service_detail }
      else
        format.html { render :new }
        format.json { render json: @budget_service_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /budget_service_details/1
  # PATCH/PUT /budget_service_details/1.json
  def update
    respond_to do |format|
      if @budget_service_detail.update(budget_service_detail_params)
        format.html { redirect_to @budget_service_detail, notice: 'Budget service detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @budget_service_detail }
      else
        format.html { render :edit }
        format.json { render json: @budget_service_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /budget_service_details/1
  # DELETE /budget_service_details/1.json
  def destroy
    @budget_service_detail.destroy
    respond_to do |format|
      format.html { redirect_to budget_service_details_url, notice: 'Budget service detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_budget_service_detail
      @budget_service_detail = BudgetServiceDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def budget_service_detail_params
      params.require(:budget_service_detail).permit(:budget_id, :cantidad, :service_id, :subtotal)
    end
end
