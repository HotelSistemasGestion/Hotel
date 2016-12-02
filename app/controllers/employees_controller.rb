class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]
  autocomplete :employee, :cedula, :display_value => :full_name, :extra_data => [:nombre, :apellido, :direccion, :telefono]
  # GET /employees
  # GET /employees.json
  def index
    #@employees = Employee.all
    #@employees = Kaminari.paginate_array(@employees).page(params[:page]).per(2)
      @filterrific = initialize_filterrific(
        Employee,
        params[:filterrific],select_options: {
            sorted_by_types_of_employee: TypesOfEmployee.options_for_sorted_by_types_of_employee,
          },
         persistence_id: false
      ) or return

      @employees = @filterrific.find.page(params[:page]).paginate(:per_page => 5, :page => params[:page])
     @employes_report = @filterrific.find
      respond_to do |format|
        format.html
        format.js
      end
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
  end

  # GET /employees/new
  def new
    @employee = Employee.new
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees
  # POST /employees.json
  def create
    @employee = Employee.new(employee_params)
    @employee.estado = "Libre"
    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee, notice: 'El empleado fue creado exitosamente!!' }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employees/1
  # PATCH/PUT /employees/1.json
  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to @employee, notice: 'El empleado fue editado!!' }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    @employee.update({:types_of_employee_id => 5})
    respond_to do |format|
      format.html { redirect_to employees_url, notice: 'El empleado fue inhabilitado' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_params
      params.require(:employee).permit(:types_of_employee_id, :nombre, :apellido, :edad, :cedula, :telefono, :correo, :direccion, :hijo)
    end
end
