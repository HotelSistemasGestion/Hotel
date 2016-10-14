require 'test_helper'

class EmployeesControllerTest < ActionController::TestCase
  setup do
    @employee = employees(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:employees)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create employee" do
    assert_difference('Employee.count') do
      post :create, employee: { apellido: @employee.apellido, cedula: @employee.cedula, correo: @employee.correo, direccion: @employee.direccion, edad: @employee.edad, hijo: @employee.hijo, nombre: @employee.nombre, telefono: @employee.telefono, types_of_employee_id: @employee.types_of_employee_id }
    end

    assert_redirected_to employee_path(assigns(:employee))
  end

  test "should show employee" do
    get :show, id: @employee
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @employee
    assert_response :success
  end

  test "should update employee" do
    patch :update, id: @employee, employee: { apellido: @employee.apellido, cedula: @employee.cedula, correo: @employee.correo, direccion: @employee.direccion, edad: @employee.edad, hijo: @employee.hijo, nombre: @employee.nombre, telefono: @employee.telefono, types_of_employee_id: @employee.types_of_employee_id }
    assert_redirected_to employee_path(assigns(:employee))
  end

  test "should destroy employee" do
    assert_difference('Employee.count', -1) do
      delete :destroy, id: @employee
    end

    assert_redirected_to employees_path
  end
end
