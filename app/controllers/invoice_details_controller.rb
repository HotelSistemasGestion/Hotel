class InvoiceDetailsController < ApplicationController
  before_action :set_invoice_detail, only: [:show, :edit, :update, :destroy]

  # GET /invoice_details
  # GET /invoice_details.json
  def index
    @invoice_details = InvoiceDetail.all
  end

  # GET /invoice_details/1
  # GET /invoice_details/1.json
  def show
  end

  # GET /invoice_details/new
  def new
    @invoice_detail = InvoiceDetail.new
  end

  # GET /invoice_details/1/edit
  def edit
  end

  # POST /invoice_details
  # POST /invoice_details.json
  def create
    @invoice_detail = InvoiceDetail.new(invoice_detail_params)

    respond_to do |format|
      if @invoice_detail.save
        format.html { redirect_to @invoice_detail, notice: 'Invoice detail was successfully created.' }
        format.json { render :show, status: :created, location: @invoice_detail }
      else
        format.html { render :new }
        format.json { render json: @invoice_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoice_details/1
  # PATCH/PUT /invoice_details/1.json
  def update
    respond_to do |format|
      if @invoice_detail.update(invoice_detail_params)
        format.html { redirect_to @invoice_detail, notice: 'Invoice detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @invoice_detail }
      else
        format.html { render :edit }
        format.json { render json: @invoice_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoice_details/1
  # DELETE /invoice_details/1.json
  def destroy
    @invoice_detail.destroy
    respond_to do |format|
      format.html { redirect_to invoice_details_url, notice: 'Invoice detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice_detail
      @invoice_detail = InvoiceDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invoice_detail_params
      params.require(:invoice_detail).permit(:invoice_id, :service_id, :servicio, :cantidad, :precio, :subtotal)
    end
end
