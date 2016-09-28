class DetailOfPaymentTypesController < ApplicationController
  before_action :set_detail_of_payment_type, only: [:show, :edit, :update, :destroy]

  # GET /detail_of_payment_types
  # GET /detail_of_payment_types.json
  def index
    @detail_of_payment_types = DetailOfPaymentType.all
  end

  # GET /detail_of_payment_types/1
  # GET /detail_of_payment_types/1.json
  def show
  end

  # GET /detail_of_payment_types/new
  def new
    @detail_of_payment_type = DetailOfPaymentType.new
  end

  # GET /detail_of_payment_types/1/edit
  def edit
  end

  # POST /detail_of_payment_types
  # POST /detail_of_payment_types.json
  def create
    @detail_of_payment_type = DetailOfPaymentType.new(detail_of_payment_type_params)

    respond_to do |format|
      if @detail_of_payment_type.save
        format.html { redirect_to @detail_of_payment_type, notice: 'Detail of payment type was successfully created.' }
        format.json { render :show, status: :created, location: @detail_of_payment_type }
      else
        format.html { render :new }
        format.json { render json: @detail_of_payment_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /detail_of_payment_types/1
  # PATCH/PUT /detail_of_payment_types/1.json
  def update
    respond_to do |format|
      if @detail_of_payment_type.update(detail_of_payment_type_params)
        format.html { redirect_to @detail_of_payment_type, notice: 'Detail of payment type was successfully updated.' }
        format.json { render :show, status: :ok, location: @detail_of_payment_type }
      else
        format.html { render :edit }
        format.json { render json: @detail_of_payment_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /detail_of_payment_types/1
  # DELETE /detail_of_payment_types/1.json
  def destroy
    @detail_of_payment_type.destroy
    respond_to do |format|
      format.html { redirect_to detail_of_payment_types_url, notice: 'Detail of payment type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_detail_of_payment_type
      @detail_of_payment_type = DetailOfPaymentType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def detail_of_payment_type_params
      params.require(:detail_of_payment_type).permit(:titular, :banco, :numero, :tipo_tarjeta, :fecha_disponibilidad)
    end
end
