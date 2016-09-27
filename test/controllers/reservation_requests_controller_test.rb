require 'test_helper'

class ReservationRequestsControllerTest < ActionController::TestCase
  setup do
    @reservation_request = reservation_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reservation_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reservation_request" do
    assert_difference('ReservationRequest.count') do
      post :create, reservation_request: { apellido: @reservation_request.apellido, cantidad_de_adultos: @reservation_request.cantidad_de_adultos, cantidad_de_familias: @reservation_request.cantidad_de_familias, cantidad_de_ninhos: @reservation_request.cantidad_de_ninhos, check_in: @reservation_request.check_in, check_out: @reservation_request.check_out, comentarios: @reservation_request.comentarios, email: @reservation_request.email, nombre: @reservation_request.nombre, telefono: @reservation_request.telefono }
    end

    assert_redirected_to reservation_request_path(assigns(:reservation_request))
  end

  test "should show reservation_request" do
    get :show, id: @reservation_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reservation_request
    assert_response :success
  end

  test "should update reservation_request" do
    patch :update, id: @reservation_request, reservation_request: { apellido: @reservation_request.apellido, cantidad_de_adultos: @reservation_request.cantidad_de_adultos, cantidad_de_familias: @reservation_request.cantidad_de_familias, cantidad_de_ninhos: @reservation_request.cantidad_de_ninhos, check_in: @reservation_request.check_in, check_out: @reservation_request.check_out, comentarios: @reservation_request.comentarios, email: @reservation_request.email, nombre: @reservation_request.nombre, telefono: @reservation_request.telefono }
    assert_redirected_to reservation_request_path(assigns(:reservation_request))
  end

  test "should destroy reservation_request" do
    assert_difference('ReservationRequest.count', -1) do
      delete :destroy, id: @reservation_request
    end

    assert_redirected_to reservation_requests_path
  end
end
