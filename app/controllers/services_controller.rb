class ServicesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_service, only: [:show, :edit, :update, :destroy]
  
  autocomplete :service, :nombre, :extra_data => [:id,:precio] do |items|
    respond_to do |format|
    format.json { render :json => @items }
    end
  end
  # GET /services
  # GET /services.json
  def index
    @services = Service.all
  end

  # GET /services/1
  # GET /services/1.json
  def show          
    @service = Service.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  # GET /services/new
  def new
    @service = Service.new
  end

  # GET /services/1/edit
  def edit   
  end

  # POST /services
  # POST /services.json
  def create
    @service = Service.new(service_params)    
    respond_to do |format|
      if @service.save          
        format.js { } # Hace un render a create.js.erb
      else
        format.html { render :new }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /services/1
  # PATCH/PUT /services/1.json
  def update
    respond_to do |format|
      if @service.update(service_params)        
        format.js { }
      else
        format.html { render :edit }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /services/1
  # DELETE /services/1.json
  def destroy
    @service.destroy
    respond_to do |format|
      format.html { redirect_to services_url, notice: 'El servicio ha sido eliminado.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_params
      params.require(:service).permit(:nombre, :descripcion, :precio)
    end
end
