require 'test_helper'

class BudgetRoomDetailsControllerTest < ActionController::TestCase
  setup do
    @budget_room_detail = budget_room_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:budget_room_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create budget_room_detail" do
    assert_difference('BudgetRoomDetail.count') do
      post :create, budget_room_detail: { budget: @budget_room_detail.budget, cantidad: @budget_room_detail.cantidad, subtotal: @budget_room_detail.subtotal, type_of_room: @budget_room_detail.type_of_room }
    end

    assert_redirected_to budget_room_detail_path(assigns(:budget_room_detail))
  end

  test "should show budget_room_detail" do
    get :show, id: @budget_room_detail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @budget_room_detail
    assert_response :success
  end

  test "should update budget_room_detail" do
    patch :update, id: @budget_room_detail, budget_room_detail: { budget: @budget_room_detail.budget, cantidad: @budget_room_detail.cantidad, subtotal: @budget_room_detail.subtotal, type_of_room: @budget_room_detail.type_of_room }
    assert_redirected_to budget_room_detail_path(assigns(:budget_room_detail))
  end

  test "should destroy budget_room_detail" do
    assert_difference('BudgetRoomDetail.count', -1) do
      delete :destroy, id: @budget_room_detail
    end

    assert_redirected_to budget_room_details_path
  end
end
