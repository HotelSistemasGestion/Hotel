require 'test_helper'

class ClosingCashesControllerTest < ActionController::TestCase
  setup do
    @closing_cash = closing_cashes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:closing_cashes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create closing_cash" do
    assert_difference('ClosingCash.count') do
      post :create, closing_cash: { fecha_cierre: @closing_cash.fecha_cierre, monto_cheque: @closing_cash.monto_cheque, monto_efectivo: @closing_cash.monto_efectivo, monto_tcredito: @closing_cash.monto_tcredito, monto_tdebito: @closing_cash.monto_tdebito }
    end

    assert_redirected_to closing_cash_path(assigns(:closing_cash))
  end

  test "should show closing_cash" do
    get :show, id: @closing_cash
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @closing_cash
    assert_response :success
  end

  test "should update closing_cash" do
    patch :update, id: @closing_cash, closing_cash: { fecha_cierre: @closing_cash.fecha_cierre, monto_cheque: @closing_cash.monto_cheque, monto_efectivo: @closing_cash.monto_efectivo, monto_tcredito: @closing_cash.monto_tcredito, monto_tdebito: @closing_cash.monto_tdebito }
    assert_redirected_to closing_cash_path(assigns(:closing_cash))
  end

  test "should destroy closing_cash" do
    assert_difference('ClosingCash.count', -1) do
      delete :destroy, id: @closing_cash
    end

    assert_redirected_to closing_cashes_path
  end
end
