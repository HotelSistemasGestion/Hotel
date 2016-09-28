require 'test_helper'

class OpeningCashesControllerTest < ActionController::TestCase
  setup do
    @opening_cash = opening_cashes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:opening_cashes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create opening_cash" do
    assert_difference('OpeningCash.count') do
      post :create, opening_cash: { fecha_apertura: @opening_cash.fecha_apertura, monto_efectivo: @opening_cash.monto_efectivo }
    end

    assert_redirected_to opening_cash_path(assigns(:opening_cash))
  end

  test "should show opening_cash" do
    get :show, id: @opening_cash
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @opening_cash
    assert_response :success
  end

  test "should update opening_cash" do
    patch :update, id: @opening_cash, opening_cash: { fecha_apertura: @opening_cash.fecha_apertura, monto_efectivo: @opening_cash.monto_efectivo }
    assert_redirected_to opening_cash_path(assigns(:opening_cash))
  end

  test "should destroy opening_cash" do
    assert_difference('OpeningCash.count', -1) do
      delete :destroy, id: @opening_cash
    end

    assert_redirected_to opening_cashes_path
  end
end
