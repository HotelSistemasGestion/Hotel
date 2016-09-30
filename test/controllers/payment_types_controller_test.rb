require 'test_helper'

class PaymentTypesControllerTest < ActionController::TestCase
  setup do
    @payment_type = payment_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:payment_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create payment_type" do
    assert_difference('PaymentType.count') do
      post :create, payment_type: { descripcion: @payment_type.descripcion }
    end

    assert_redirected_to payment_type_path(assigns(:payment_type))
  end

  test "should show payment_type" do
    get :show, id: @payment_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @payment_type
    assert_response :success
  end

  test "should update payment_type" do
    patch :update, id: @payment_type, payment_type: { descripcion: @payment_type.descripcion }
    assert_redirected_to payment_type_path(assigns(:payment_type))
  end

  test "should destroy payment_type" do
    assert_difference('PaymentType.count', -1) do
      delete :destroy, id: @payment_type
    end

    assert_redirected_to payment_types_path
  end
end
