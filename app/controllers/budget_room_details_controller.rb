class BudgetRoomDetailsController < ApplicationController
  before_action :set_budget_room_detail, only: [:show, :edit, :update, :destroy]

  # GET /budget_room_details
  # GET /budget_room_details.json
  def index
    @budget_room_details = BudgetRoomDetail.all
  end

  # GET /budget_room_details/1
  # GET /budget_room_details/1.json
  def show
  end

  # GET /budget_room_details/new
  def new
    @budget_room_detail = BudgetRoomDetail.new
  end

  # GET /budget_room_details/1/edit
  def edit
  end

  # POST /budget_room_details
  # POST /budget_room_details.json
  def create
    @budget_room_detail = BudgetRoomDetail.new(budget_room_detail_params)

    respond_to do |format|
      if @budget_room_detail.save
        format.html { redirect_to @budget_room_detail, notice: 'Budget room detail was successfully created.' }
        format.json { render :show, status: :created, location: @budget_room_detail }
      else
        format.html { render :new }
        format.json { render json: @budget_room_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /budget_room_details/1
  # PATCH/PUT /budget_room_details/1.json
  def update
    respond_to do |format|
      if @budget_room_detail.update(budget_room_detail_params)
        format.html { redirect_to @budget_room_detail, notice: 'Budget room detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @budget_room_detail }
      else
        format.html { render :edit }
        format.json { render json: @budget_room_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /budget_room_details/1
  # DELETE /budget_room_details/1.json
  def destroy
    @budget_room_detail.destroy
    respond_to do |format|
      format.html { redirect_to budget_room_details_url, notice: 'Budget room detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_budget_room_detail
      @budget_room_detail = BudgetRoomDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def budget_room_detail_params
      params.require(:budget_room_detail).permit(:budget, :cantidad, :type_of_room, :subtotal)
    end
end
