require 'test_helper'

class CashMovementsControllerTest < ActionController::TestCase
  setup do
    @cash_movement = cash_movements(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cash_movements)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cash_movement" do
    assert_difference('CashMovement.count') do
      post :create, cash_movement: { monto_total: @cash_movement.monto_total }
    end

    assert_redirected_to cash_movement_path(assigns(:cash_movement))
  end

  test "should show cash_movement" do
    get :show, id: @cash_movement
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cash_movement
    assert_response :success
  end

  test "should update cash_movement" do
    patch :update, id: @cash_movement, cash_movement: { monto_total: @cash_movement.monto_total }
    assert_redirected_to cash_movement_path(assigns(:cash_movement))
  end

  test "should destroy cash_movement" do
    assert_difference('CashMovement.count', -1) do
      delete :destroy, id: @cash_movement
    end

    assert_redirected_to cash_movements_path
  end
end
