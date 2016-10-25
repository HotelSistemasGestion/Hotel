class DetailOfCashMovementsController < ApplicationController
  before_action :set_detail_of_cash_movement, only: [:show, :edit, :update, :destroy]

  # GET /detail_of_cash_movements
  # GET /detail_of_cash_movements.json
  def index
    @detail_of_cash_movements = DetailOfCashMovement.all
  end

  # GET /detail_of_cash_movements/1
  # GET /detail_of_cash_movements/1.json
  def show
  end

  # GET /detail_of_cash_movements/new
  def new
    @detail_of_cash_movement = DetailOfCashMovement.new
  end

  # GET /detail_of_cash_movements/1/edit
  def edit
  end

  # POST /detail_of_cash_movements
  # POST /detail_of_cash_movements.json
  def create
    @detail_of_cash_movement = DetailOfCashMovement.new(detail_of_cash_movement_params)

    respond_to do |format|
      if @detail_of_cash_movement.save
        format.html { redirect_to @detail_of_cash_movement, notice: 'Detail of cash movement was successfully created.' }
        format.json { render :show, status: :created, location: @detail_of_cash_movement }
      else
        format.html { render :new }
        format.json { render json: @detail_of_cash_movement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /detail_of_cash_movements/1
  # PATCH/PUT /detail_of_cash_movements/1.json
  def update
    respond_to do |format|
      if @detail_of_cash_movement.update(detail_of_cash_movement_params)
        format.html { redirect_to @detail_of_cash_movement, notice: 'Detail of cash movement was successfully updated.' }
        format.json { render :show, status: :ok, location: @detail_of_cash_movement }
      else
        format.html { render :edit }
        format.json { render json: @detail_of_cash_movement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /detail_of_cash_movements/1
  # DELETE /detail_of_cash_movements/1.json
  def destroy
    @detail_of_cash_movement.destroy
    respond_to do |format|
      format.html { redirect_to detail_of_cash_movements_url, notice: 'Detail of cash movement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_detail_of_cash_movement
      @detail_of_cash_movement = DetailOfCashMovement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def detail_of_cash_movement_params
      params.require(:detail_of_cash_movement).permit(:cash_movement_id, :sub_monto)
    end
end
