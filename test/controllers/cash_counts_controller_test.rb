require 'test_helper'

class CashCountsControllerTest < ActionController::TestCase
  setup do
    @cash_count = cash_counts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cash_counts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cash_count" do
    assert_difference('CashCount.count') do
      post :create, cash_count: { fecha_arqueo: @cash_count.fecha_arqueo }
    end

    assert_redirected_to cash_count_path(assigns(:cash_count))
  end

  test "should show cash_count" do
    get :show, id: @cash_count
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cash_count
    assert_response :success
  end

  test "should update cash_count" do
    patch :update, id: @cash_count, cash_count: { fecha_arqueo: @cash_count.fecha_arqueo }
    assert_redirected_to cash_count_path(assigns(:cash_count))
  end

  test "should destroy cash_count" do
    assert_difference('CashCount.count', -1) do
      delete :destroy, id: @cash_count
    end

    assert_redirected_to cash_counts_path
  end
end
