class PaymentTypesController < ApplicationController
  before_action :set_payment_type, only: [:show, :edit, :update, :destroy]

  # GET /payment_types
  # GET /payment_types.json
  def index
    @payment_types = PaymentType.all
  end

  # GET /payment_types/1
  # GET /payment_types/1.json
  def show
  end

  # GET /payment_types/new
  def new
    @payment_type = PaymentType.new
  end

  # GET /payment_types/1/edit
  def edit
  end

  # POST /payment_types
  # POST /payment_types.json
  def create
    @payment_type = PaymentType.new(payment_type_params)

    respond_to do |format|
      if @payment_type.save
        format.html { redirect_to @payment_type, notice: 'Payment type was successfully created.' }
        format.json { render :show, status: :created, location: @payment_type }
      else
        format.html { render :new }
        format.json { render json: @payment_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payment_types/1
  # PATCH/PUT /payment_types/1.json
  def update
    respond_to do |format|
      if @payment_type.update(payment_type_params)
        format.html { redirect_to @payment_type, notice: 'Payment type was successfully updated.' }
        format.json { render :show, status: :ok, location: @payment_type }
      else
        format.html { render :edit }
        format.json { render json: @payment_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payment_types/1
  # DELETE /payment_types/1.json
  def destroy
    @payment_type.destroy
    respond_to do |format|
      format.html { redirect_to payment_types_url, notice: 'Payment type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment_type
      @payment_type = PaymentType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_type_params
      params.require(:payment_type).permit(:descripcion)
    end
end
