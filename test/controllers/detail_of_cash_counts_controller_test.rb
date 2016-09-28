require 'test_helper'

class DetailOfCashCountsControllerTest < ActionController::TestCase
  setup do
    @detail_of_cash_count = detail_of_cash_counts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:detail_of_cash_counts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create detail_of_cash_count" do
    assert_difference('DetailOfCashCount.count') do
      post :create, detail_of_cash_count: { monto_caja: @detail_of_cash_count.monto_caja, monto_sistema: @detail_of_cash_count.monto_sistema }
    end

    assert_redirected_to detail_of_cash_count_path(assigns(:detail_of_cash_count))
  end

  test "should show detail_of_cash_count" do
    get :show, id: @detail_of_cash_count
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @detail_of_cash_count
    assert_response :success
  end

  test "should update detail_of_cash_count" do
    patch :update, id: @detail_of_cash_count, detail_of_cash_count: { monto_caja: @detail_of_cash_count.monto_caja, monto_sistema: @detail_of_cash_count.monto_sistema }
    assert_redirected_to detail_of_cash_count_path(assigns(:detail_of_cash_count))
  end

  test "should destroy detail_of_cash_count" do
    assert_difference('DetailOfCashCount.count', -1) do
      delete :destroy, id: @detail_of_cash_count
    end

    assert_redirected_to detail_of_cash_counts_path
  end
end
