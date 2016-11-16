require 'test_helper'

class ReservationRoomsControllerTest < ActionController::TestCase
  setup do
    @reservation_room = reservation_rooms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reservation_rooms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reservation_room" do
    assert_difference('ReservationRoom.count') do
      post :create, reservation_room: { reservation_id: @reservation_room.reservation_id, room_id: @reservation_room.room_id, subtotal: @reservation_room.subtotal }
    end

    assert_redirected_to reservation_room_path(assigns(:reservation_room))
  end

  test "should show reservation_room" do
    get :show, id: @reservation_room
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reservation_room
    assert_response :success
  end

  test "should update reservation_room" do
    patch :update, id: @reservation_room, reservation_room: { reservation_id: @reservation_room.reservation_id, room_id: @reservation_room.room_id, subtotal: @reservation_room.subtotal }
    assert_redirected_to reservation_room_path(assigns(:reservation_room))
  end

  test "should destroy reservation_room" do
    assert_difference('ReservationRoom.count', -1) do
      delete :destroy, id: @reservation_room
    end

    assert_redirected_to reservation_rooms_path
  end
end
