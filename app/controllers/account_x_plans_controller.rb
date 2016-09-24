class AccountXPlansController < ApplicationController
  before_action :set_account_x_plan, only: [:show, :edit, :update, :destroy]

  # GET /account_x_plans
  # GET /account_x_plans.json
  def index
    @account_x_plans = AccountXPlan.all
  end

  # GET /account_x_plans/1
  # GET /account_x_plans/1.json
  def show
  end

  # GET /account_x_plans/new
  def new
    @account_x_plan = AccountXPlan.new
  end

  # GET /account_x_plans/1/edit
  def edit
  end

  # POST /account_x_plans
  # POST /account_x_plans.json
  def create
    @account_x_plan = AccountXPlan.new(account_x_plan_params)

    respond_to do |format|
      if @account_x_plan.save
        format.html { redirect_to @account_x_plan, notice: 'Account x plan was successfully created.' }
        format.json { render :show, status: :created, location: @account_x_plan }
      else
        format.html { render :new }
        format.json { render json: @account_x_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /account_x_plans/1
  # PATCH/PUT /account_x_plans/1.json
  def update
    respond_to do |format|
      if @account_x_plan.update(account_x_plan_params)
        format.html { redirect_to @account_x_plan, notice: 'Account x plan was successfully updated.' }
        format.json { render :show, status: :ok, location: @account_x_plan }
      else
        format.html { render :edit }
        format.json { render json: @account_x_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /account_x_plans/1
  # DELETE /account_x_plans/1.json
  def destroy
    @account_x_plan.destroy
    respond_to do |format|
      format.html { redirect_to account_x_plans_url, notice: 'Account x plan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account_x_plan
      @account_x_plan = AccountXPlan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_x_plan_params
      params.require(:account_x_plan).permit(:cuenta_superior)
    end
end
