class BudgetsController < ApplicationController
  before_action :set_budget, only: [:show, :edit, :update, :destroy]


 

  # GET /budgets
  # GET /budgets.json
  def index
    @budgets = Budget.all
  end

  # GET /budgets/1
  # GET /budgets/1.json
  def show
  end

  # GET /budgets/new
  def new
    @budget = Budget.new
  end

  def my_new
    @budget = Budget.new
    @budget.budget_details.build()
    @my_reservation_requests = ReservationRequest.find(params[:id])
  end
  # GET /budgets/1/edit
  def edit
    @my_budget = Budget.find(params[:id])

  end

  # POST /budgets
  # POST /budgets.json
  def create
    @budget = Budget.new(budget_params)
    @budget1 =  @budget
    respond_to do |format|
      if @budget.save
        BudgetMailer.budget_email(@budget1).deliver_now
        format.html { redirect_to @budget, notice: 'Budget was successfully created.' }
        format.json { render :show, status: :created, location: @budget }
      else
        format.html { render :new }
        format.json { render json: @budget.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /budgets/1
  # PATCH/PUT /budgets/1.json
  def update
    @budget = Budget.find(params[:id])
    @budget1 =  @budget
    respond_to do |format|
      if @budget.update(budget_params)
        BudgetMailer.budget_email(@budget1).deliver_now
        format.html { redirect_to @budget, notice: 'Budget was successfully updated.' }
        format.json { render :show, status: :ok, location: @budget }
      else
        format.html { render :edit }
        format.json { render json: @budget.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /budgets/1
  # DELETE /budgets/1.json
  def destroy
    @budget.destroy
    respond_to do |format|
      format.html { redirect_to budgets_url, notice: 'Budget was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_budget
      @budget = Budget.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def budget_params
      params.require(:budget).permit(:id,:reservation_request_id, :email,:coomfort_id,:cantidad_de_habitaciones, :dias, :descuento, :total, :budget_details_attributes => [:id, :cantidad, :service_id, :subtotal, :_destroy])
    end
end
