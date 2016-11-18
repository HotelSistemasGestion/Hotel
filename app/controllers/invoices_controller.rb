class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show, :update, :destroy]

  # GET /invoices
  # GET /invoices.json
  def index
    @invoices = Invoice.all.order(:created_at).reverse
    @invoices = Kaminari.paginate_array(@invoices).page(params[:page]).per(5)
  end

  # GET /invoices/1
  # GET /invoices/1.json
  def show
  end

  # GET /invoices/new
  def new
    @invoice = Invoice.new
  end

  # POST /invoices
  # POST /invoices.json
  def create
    @invoice = Invoice.new(invoice_params)
    respond_to do |format|
      if @invoice.save
        format.html { redirect_to invoices_url }        
      else
        format.html { render :new, notice: 'La Factura fue creada correctamente.' }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoices/1
  # PATCH/PUT /invoices/1.json
  def update
    respond_to do |format|
      if @invoice.update(invoice_params)
        format.html { redirect_to @invoice, notice: 'La Factura fue editada correctamente.' }
        format.json { render :show, status: :ok, location: @invoice }
      else
        format.html { render :edit }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.json
  def destroy
    @invoice.state="cancelado"
    @invoice.save
    respond_to do |format|
      format.html { redirect_to invoices_url, notice: 'La Factura fue cancelada correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice
      @invoice = Invoice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invoice_params
      params.require(:invoice).permit(:nombre,
                                      :ruc, 
                                      :direccion, 
                                      :celular,
                                      :correo,
                                      :numero, 
                                      :client_id, 
                                      :fecha, 
                                      :descuento,
                                      :subtotal,
                                      :total,
                                      :state,
                                      :account_id,
                                      :invoice_details_attributes => [:id, :service_id, :cantidad, :precio, :subtotal])
    end
end
