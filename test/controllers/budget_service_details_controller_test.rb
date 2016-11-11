require 'test_helper'

class BudgetServiceDetailsControllerTest < ActionController::TestCase
  setup do
    @budget_service_detail = budget_service_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:budget_service_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create budget_service_detail" do
    assert_difference('BudgetServiceDetail.count') do
      post :create, budget_service_detail: { budget_id: @budget_service_detail.budget_id, cantidad: @budget_service_detail.cantidad, service_id: @budget_service_detail.service_id, subtotal: @budget_service_detail.subtotal }
    end

    assert_redirected_to budget_service_detail_path(assigns(:budget_service_detail))
  end

  test "should show budget_service_detail" do
    get :show, id: @budget_service_detail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @budget_service_detail
    assert_response :success
  end

  test "should update budget_service_detail" do
    patch :update, id: @budget_service_detail, budget_service_detail: { budget_id: @budget_service_detail.budget_id, cantidad: @budget_service_detail.cantidad, service_id: @budget_service_detail.service_id, subtotal: @budget_service_detail.subtotal }
    assert_redirected_to budget_service_detail_path(assigns(:budget_service_detail))
  end

  test "should destroy budget_service_detail" do
    assert_difference('BudgetServiceDetail.count', -1) do
      delete :destroy, id: @budget_service_detail
    end

    assert_redirected_to budget_service_details_path
  end
end
