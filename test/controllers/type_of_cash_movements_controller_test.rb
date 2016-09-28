require 'test_helper'

class TypeOfCashMovementsControllerTest < ActionController::TestCase
  setup do
    @type_of_cash_movement = type_of_cash_movements(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:type_of_cash_movements)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create type_of_cash_movement" do
    assert_difference('TypeOfCashMovement.count') do
      post :create, type_of_cash_movement: { descripcion: @type_of_cash_movement.descripcion }
    end

    assert_redirected_to type_of_cash_movement_path(assigns(:type_of_cash_movement))
  end

  test "should show type_of_cash_movement" do
    get :show, id: @type_of_cash_movement
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @type_of_cash_movement
    assert_response :success
  end

  test "should update type_of_cash_movement" do
    patch :update, id: @type_of_cash_movement, type_of_cash_movement: { descripcion: @type_of_cash_movement.descripcion }
    assert_redirected_to type_of_cash_movement_path(assigns(:type_of_cash_movement))
  end

  test "should destroy type_of_cash_movement" do
    assert_difference('TypeOfCashMovement.count', -1) do
      delete :destroy, id: @type_of_cash_movement
    end

    assert_redirected_to type_of_cash_movements_path
  end
end
