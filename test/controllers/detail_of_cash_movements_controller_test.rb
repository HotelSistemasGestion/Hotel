require 'test_helper'

class DetailOfCashMovementsControllerTest < ActionController::TestCase
  setup do
    @detail_of_cash_movement = detail_of_cash_movements(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:detail_of_cash_movements)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create detail_of_cash_movement" do
    assert_difference('DetailOfCashMovement.count') do
      post :create, detail_of_cash_movement: { sub_monto: @detail_of_cash_movement.sub_monto }
    end

    assert_redirected_to detail_of_cash_movement_path(assigns(:detail_of_cash_movement))
  end

  test "should show detail_of_cash_movement" do
    get :show, id: @detail_of_cash_movement
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @detail_of_cash_movement
    assert_response :success
  end

  test "should update detail_of_cash_movement" do
    patch :update, id: @detail_of_cash_movement, detail_of_cash_movement: { sub_monto: @detail_of_cash_movement.sub_monto }
    assert_redirected_to detail_of_cash_movement_path(assigns(:detail_of_cash_movement))
  end

  test "should destroy detail_of_cash_movement" do
    assert_difference('DetailOfCashMovement.count', -1) do
      delete :destroy, id: @detail_of_cash_movement
    end

    assert_redirected_to detail_of_cash_movements_path
  end
end
