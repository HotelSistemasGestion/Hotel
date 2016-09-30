class BudgetDetailsController < ApplicationController
  before_action :set_budget_detail, only: [:show, :edit, :update, :destroy]

  # GET /budget_details
  # GET /budget_details.json
  def index
    @budget_details = BudgetDetail.all
  end

  # GET /budget_details/1
  # GET /budget_details/1.json
  def show
  end

  # GET /budget_details/new
  def new
    @budget_detail = BudgetDetail.new
  end

  # GET /budget_details/1/edit
  def edit
  end

  # POST /budget_details
  # POST /budget_details.json
  def create
    @budget_detail = BudgetDetail.new(budget_detail_params)

    respond_to do |format|
      if @budget_detail.save
        format.html { redirect_to @budget_detail, notice: 'Budget detail was successfully created.' }
        format.json { render :show, status: :created, location: @budget_detail }
      else
        format.html { render :new }
        format.json { render json: @budget_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /budget_details/1
  # PATCH/PUT /budget_details/1.json
  def update
    respond_to do |format|
      if @budget_detail.update(budget_detail_params)
        format.html { redirect_to @budget_detail, notice: 'Budget detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @budget_detail }
      else
        format.html { render :edit }
        format.json { render json: @budget_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /budget_details/1
  # DELETE /budget_details/1.json
  def destroy
    @budget_detail.destroy
    respond_to do |format|
      format.html { redirect_to budget_details_url, notice: 'Budget detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_budget_detail
      @budget_detail = BudgetDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def budget_detail_params
      params.require(:budget_detail).permit(:budget_id, :cantidad, :service_id, :subtotal)
    end
end
