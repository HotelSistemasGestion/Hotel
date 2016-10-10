require 'test_helper'

class BudgetDetailsControllerTest < ActionController::TestCase
  setup do
    @budget_detail = budget_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:budget_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create budget_detail" do
    assert_difference('BudgetDetail.count') do
      post :create, budget_detail: { budget_id: @budget_detail.budget_id, cantidad: @budget_detail.cantidad, service_id: @budget_detail.service_id, subtotal: @budget_detail.subtotal }
    end

    assert_redirected_to budget_detail_path(assigns(:budget_detail))
  end

  test "should show budget_detail" do
    get :show, id: @budget_detail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @budget_detail
    assert_response :success
  end

  test "should update budget_detail" do
    patch :update, id: @budget_detail, budget_detail: { budget_id: @budget_detail.budget_id, cantidad: @budget_detail.cantidad, service_id: @budget_detail.service_id, subtotal: @budget_detail.subtotal }
    assert_redirected_to budget_detail_path(assigns(:budget_detail))
  end

  test "should destroy budget_detail" do
    assert_difference('BudgetDetail.count', -1) do
      delete :destroy, id: @budget_detail
    end

    assert_redirected_to budget_details_path
  end
end
