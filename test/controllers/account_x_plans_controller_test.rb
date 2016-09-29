require 'test_helper'

class AccountXPlansControllerTest < ActionController::TestCase
  setup do
    @account_x_plan = account_x_plans(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:account_x_plans)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create account_x_plan" do
    assert_difference('AccountXPlan.count') do
      post :create, account_x_plan: { cuenta_superior: @account_x_plan.cuenta_superior }
    end

    assert_redirected_to account_x_plan_path(assigns(:account_x_plan))
  end

  test "should show account_x_plan" do
    get :show, id: @account_x_plan
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @account_x_plan
    assert_response :success
  end

  test "should update account_x_plan" do
    patch :update, id: @account_x_plan, account_x_plan: { cuenta_superior: @account_x_plan.cuenta_superior }
    assert_redirected_to account_x_plan_path(assigns(:account_x_plan))
  end

  test "should destroy account_x_plan" do
    assert_difference('AccountXPlan.count', -1) do
      delete :destroy, id: @account_x_plan
    end

    assert_redirected_to account_x_plans_path
  end
end
