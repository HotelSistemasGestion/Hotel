class AccountPlansController < ApplicationController
  before_action :set_account_plan, only: [:show, :edit, :update, :destroy]

  # GET /account_plans
  # GET /account_plans.json
  def index
    @account_plans = AccountPlan.all
    @accounting_years=AccountingYear.all
  end

  # GET /account_plans/1
  # GET /account_plans/1.json
  def show
    @account = AccountPlan.find(params[:id])
    @accounting_years=AccountingYear.where("account_plan_id = ?" ,params[:id])

    respond_to do |format|
      format.js
    end

  end

  # GET /account_plans/new
  def new
    @account_plan = AccountPlan.new
    @account_plan.accounting_years.build()
  end

  # GET /account_plans/1/edit
  def edit
  end

  # POST /account_plans
  # POST /account_plans.json
  def create
    @account_plan = AccountPlan.new(account_plan_params)
    
    

    respond_to do |format|
      if @account_plan.save
        @name3=@account_plan.id
      ##########################################################################################################
    @anho=AccountingYear.find_by_sql("SELECT accounting_years.estado  AS  estado from accounting_years where accounting_years.account_plan_id='#{@name3}'")   
    @anho.each do |a|
    if a.estado == "Vigente"       
            @asiento=AccountingEntry.new
            @detalle_asiento=AccountXEntry.new
            @asiento.numero=1
            @asiento.fecha=Time.now.strftime("%d-%m-%Y")
            @asiento.iva=10
            @asiento.debe=0
            @asiento.auto=0
            @asiento.haber=0
            @asiento.save
            @detalle_asiento.monto=0
            @detalle_asiento.observacion="Apertura Ejercicio"
            @detalle_asiento.account="Caja"
            @detalle_asiento.accounting_entry_id=@asiento.id
            @detalle_asiento.accounting_account_id=2
            @detalle_asiento.tipo= "D"
            @detalle_asiento.save

            @asiento=AccountingEntry.new
            @detalle_asiento=AccountXEntry.new
            @asiento.numero=1
            @asiento.fecha=Time.now.strftime("%d-%m-%Y")
            @asiento.iva=10
            @asiento.debe=0
            @asiento.auto=0
            @asiento.haber=0
            @asiento.save
            @detalle_asiento.monto=0
            @detalle_asiento.observacion="Apertura Ejercicio"
            @detalle_asiento.account="Equipo de oficina"
            @detalle_asiento.accounting_entry_id=@asiento.id
            @detalle_asiento.accounting_account_id=3
            @detalle_asiento.tipo= "D"
            @detalle_asiento.save

            @asiento=AccountingEntry.new
            @detalle_asiento=AccountXEntry.new
            @asiento.numero=1
            @asiento.fecha=Time.now.strftime("%d-%m-%Y")
            @asiento.iva=0
            @asiento.debe=0
            @asiento.auto=0
            @asiento.haber=0
            @asiento.save
            @detalle_asiento.monto=0
            @detalle_asiento.observacion="Apertura Ejercicio"
            @detalle_asiento.account="Banco"
            @detalle_asiento.accounting_entry_id=@asiento.id
            @detalle_asiento.accounting_account_id=4
            @detalle_asiento.tipo= "D"
            @detalle_asiento.save

            @asiento=AccountingEntry.new
            @detalle_asiento=AccountXEntry.new
            @asiento.numero=1
            @asiento.fecha=Time.now.strftime("%d-%m-%Y")
            @asiento.iva=10
            @asiento.debe=0
            @asiento.auto=0
            @asiento.save
            @detalle_asiento.monto=0
            @detalle_asiento.observacion="Acreedores"
            @detalle_asiento.account="Proveedores"
            @detalle_asiento.accounting_entry_id=@asiento.id
            @detalle_asiento.accounting_account_id=6
            @detalle_asiento.tipo= "A"
            @detalle_asiento.save

            @asiento=AccountingEntry.new
            @detalle_asiento=AccountXEntry.new
            @asiento.numero=1
            @asiento.fecha=Time.now.strftime("%d-%m-%Y")
            @asiento.iva=10
            @asiento.debe=0
            @asiento.auto=0
            @asiento.haber=0
            @asiento.save
            @detalle_asiento.monto=0
            @detalle_asiento.observacion="Acreedores"
            @detalle_asiento.account="Capital personas"
            @detalle_asiento.accounting_entry_id=@asiento.id
            @detalle_asiento.accounting_account_id=7
            @detalle_asiento.tipo= "A"
            @detalle_asiento.save
      end
    end                  
##########################################################################################################
        format.html { redirect_to account_plans_path, notice: 'El plan ha sido agregado con exito' }
        format.json { render :show, status: :created, location: @account_plan }
      else
        format.html { render :new }
        format.json { render json: @account_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /account_plans/1
  # PATCH/PUT /account_plans/1.json
  def update
    respond_to do |format|
      if @account_plan.update(account_plan_params)
        @name3=@account_plan.id
      ##########################################################################################################
    @anho=AccountingYear.find_by_sql("SELECT accounting_years.estado  AS  estado from accounting_years where accounting_years.account_plan_id='#{@name3}'")   
    @anho.each do |a|
    if a.estado == "Vigente"       
            @asiento=AccountingEntry.new
            @detalle_asiento=AccountXEntry.new
            @asiento.numero=1
            @asiento.fecha=Time.now.strftime("%d-%m-%Y")
            @asiento.iva=10
            @asiento.debe=0
            @asiento.auto=0
            @asiento.haber=0
            @asiento.save
            @detalle_asiento.monto=0
            @detalle_asiento.observacion="Apertura Ejercicio"
            @detalle_asiento.account="Caja"
            @detalle_asiento.accounting_entry_id=@asiento.id
            @detalle_asiento.accounting_account_id=2
            @detalle_asiento.tipo= "D"
            @detalle_asiento.save

            @asiento=AccountingEntry.new
            @detalle_asiento=AccountXEntry.new
            @asiento.numero=1
            @asiento.fecha=Time.now.strftime("%d-%m-%Y")
            @asiento.iva=10
            @asiento.debe=0
            @asiento.auto=0
            @asiento.haber=0
            @asiento.save
            @detalle_asiento.monto=0
            @detalle_asiento.observacion="Apertura Ejercicio"
            @detalle_asiento.account="Equipo de oficina"
            @detalle_asiento.accounting_entry_id=@asiento.id
            @detalle_asiento.accounting_account_id=3
            @detalle_asiento.tipo= "D"
            @detalle_asiento.save

            @asiento=AccountingEntry.new
            @detalle_asiento=AccountXEntry.new
            @asiento.numero=1
            @asiento.fecha=Time.now.strftime("%d-%m-%Y")
            @asiento.iva=10
            @asiento.debe=0
            @asiento.haber=0
            @asiento.auto=0
            @asiento.save
            @detalle_asiento.monto=0
            @detalle_asiento.observacion="Apertura Ejercicio"
            @detalle_asiento.account="Banco"
            @detalle_asiento.accounting_entry_id=@asiento.id
            @detalle_asiento.accounting_account_id=4
            @detalle_asiento.tipo= "D"
            @detalle_asiento.save

            @asiento=AccountingEntry.new
            @detalle_asiento=AccountXEntry.new
            @asiento.numero=1
            @asiento.fecha=Time.now.strftime("%d-%m-%Y")
            @asiento.iva=10
            @asiento.debe=0
            @asiento.auto=0
            @asiento.save
            @detalle_asiento.monto=0
            @detalle_asiento.observacion="Acreedores"
            @detalle_asiento.account="Proveedores"
            @detalle_asiento.accounting_entry_id=@asiento.id
            @detalle_asiento.accounting_account_id=6
            @detalle_asiento.tipo= "A"
            @detalle_asiento.save

            @asiento=AccountingEntry.new
            @detalle_asiento=AccountXEntry.new
            @asiento.numero=1
            @asiento.fecha=Time.now.strftime("%d-%m-%Y")
            @asiento.iva=10
            @asiento.debe=0
            @asiento.auto=0
            @asiento.haber=0
            @asiento.save
            @detalle_asiento.monto=0
            @detalle_asiento.observacion="Acreedores"
            @detalle_asiento.account="Capital personas"
            @detalle_asiento.accounting_entry_id=@asiento.id
            @detalle_asiento.accounting_account_id=7
            @detalle_asiento.tipo= "A"
            @detalle_asiento.save
      end
    end       
        format.html { redirect_to account_plans_path, notice: 'El plan de cuentas ha sido actualizado.' }
        format.json { render :show, status: :ok, location: @account_plan }

      else
        format.html { render :edit }
        format.json { render json: @account_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /account_plans/1
  # DELETE /account_plans/1.json
  def destroy
    
    @account_plan.destroy
    respond_to do |format|
      format.html { redirect_to account_plans_path, notice: 'El plan ha sido eliminado correctamente!! ' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account_plan
      @account_plan = AccountPlan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_plan_params
      params.require(:account_plan).permit(:id ,:descripcion, :estado, :version ,:accounting_years_attributes => [:id, :anho,:estado,:_destroy])
    end
end
