class TypeOfCashMovementsController < ApplicationController
  before_action :set_type_of_cash_movement, only: [:show, :edit, :update, :destroy]

  # GET /type_of_cash_movements
  # GET /type_of_cash_movements.json
  def index
    @type_of_cash_movements = TypeOfCashMovement.all
  end

  # GET /type_of_cash_movements/1
  # GET /type_of_cash_movements/1.json
  def show
  end

  # GET /type_of_cash_movements/new
  def new
    @type_of_cash_movement = TypeOfCashMovement.new
  end

  # GET /type_of_cash_movements/1/edit
  def edit
  end

  # POST /type_of_cash_movements
  # POST /type_of_cash_movements.json
  def create
    @type_of_cash_movement = TypeOfCashMovement.new(type_of_cash_movement_params)

    respond_to do |format|
      if @type_of_cash_movement.save
        format.html { redirect_to @type_of_cash_movement, notice: 'Type of cash movement was successfully created.' }
        format.json { render :show, status: :created, location: @type_of_cash_movement }
      else
        format.html { render :new }
        format.json { render json: @type_of_cash_movement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /type_of_cash_movements/1
  # PATCH/PUT /type_of_cash_movements/1.json
  def update
    respond_to do |format|
      if @type_of_cash_movement.update(type_of_cash_movement_params)
        format.html { redirect_to @type_of_cash_movement, notice: 'Type of cash movement was successfully updated.' }
        format.json { render :show, status: :ok, location: @type_of_cash_movement }
      else
        format.html { render :edit }
        format.json { render json: @type_of_cash_movement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /type_of_cash_movements/1
  # DELETE /type_of_cash_movements/1.json
  def destroy
    @type_of_cash_movement.destroy
    respond_to do |format|
      format.html { redirect_to type_of_cash_movements_url, notice: 'Type of cash movement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type_of_cash_movement
      @type_of_cash_movement = TypeOfCashMovement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def type_of_cash_movement_params
      params.require(:type_of_cash_movement).permit(:descripcion)
    end
end
