require 'test_helper'

class DetailOfPaymentTypesControllerTest < ActionController::TestCase
  setup do
    @detail_of_payment_type = detail_of_payment_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:detail_of_payment_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create detail_of_payment_type" do
    assert_difference('DetailOfPaymentType.count') do
      post :create, detail_of_payment_type: { banco: @detail_of_payment_type.banco, fecha_disponibilidad: @detail_of_payment_type.fecha_disponibilidad, numero: @detail_of_payment_type.numero, tipo_tarjeta: @detail_of_payment_type.tipo_tarjeta, titular: @detail_of_payment_type.titular }
    end

    assert_redirected_to detail_of_payment_type_path(assigns(:detail_of_payment_type))
  end

  test "should show detail_of_payment_type" do
    get :show, id: @detail_of_payment_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @detail_of_payment_type
    assert_response :success
  end

  test "should update detail_of_payment_type" do
    patch :update, id: @detail_of_payment_type, detail_of_payment_type: { banco: @detail_of_payment_type.banco, fecha_disponibilidad: @detail_of_payment_type.fecha_disponibilidad, numero: @detail_of_payment_type.numero, tipo_tarjeta: @detail_of_payment_type.tipo_tarjeta, titular: @detail_of_payment_type.titular }
    assert_redirected_to detail_of_payment_type_path(assigns(:detail_of_payment_type))
  end

  test "should destroy detail_of_payment_type" do
    assert_difference('DetailOfPaymentType.count', -1) do
      delete :destroy, id: @detail_of_payment_type
    end

    assert_redirected_to detail_of_payment_types_path
  end
end
