class ServicesController < ApplicationController
  before_action :authenticate_user!  
  load_and_authorize_resource
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
    @cuenta = AccountingAccount.new
    @name=@service.nombre    
    @idp=@service.cuenta_padre
    respond_to do |format|
      if @service.save 
        @cuenta.nombre=@name
        @cuenta.imputable=true
        @cuenta.cuenta=0
        @padres=AccountingAccount.find(@idp)
        @padre=@padres.parent_id
        @padre1=AccountingAccount.where("parent_id = ?", @padre)
        @cuenta.ejercicio=@padres.ejercicio
        @cuenta.parent_id=@padre
        @contar=0;
        @padre1.each do |c|
            @contar = @contar + 1
        end
        @guarda=0
        if @contar < 10
          @padre1.each do |z|
             @guardado=z.grupo
            end
          @guarda=(@guardado*100)+(@guardado*10)+1 
         end
        if @contar>10 
        @contar2=0
        @padre1.each do |n|
            @contar2 = @contar2 + 1 
            if @contar == @contar2
              @guarda=n.grupo
            end
          end
        end
        @cuenta.grupo= @guarda + 1
        @cuenta.save
        format.html { redirect_to accounting_accounts_path, notice: 'El servicio ha sido agregada con exito' }
        format.json { render :show, status: :created, location: @service }
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

  
  def report
  @filterrific = initialize_filterrific(
    Service,
    params[:filterrific],select_options: {
        sorted_by_service: Service.options_for_sorted_by_service
      },
     persistence_id: false
  ) or return

  @services = @filterrific.find.page(params[:page]).paginate(:per_page => 5, :page => params[:page])
  @services_report = @filterrific.find
  respond_to do |format|
    format.html
    format.js
  end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_params
      params.require(:service).permit(:nombre, :descripcion, :precio,:cuenta_padre)
    end
end
