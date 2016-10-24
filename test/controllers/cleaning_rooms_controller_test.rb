require 'test_helper'

class CleaningRoomsControllerTest < ActionController::TestCase
  setup do
    @cleaning_room = cleaning_rooms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cleaning_rooms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cleaning_room" do
    assert_difference('CleaningRoom.count') do
      post :create, cleaning_room: { day: @cleaning_room.day, employee_id: @cleaning_room.employee_id, room_id: @cleaning_room.room_id }
    end

    assert_redirected_to cleaning_room_path(assigns(:cleaning_room))
  end

  test "should show cleaning_room" do
    get :show, id: @cleaning_room
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cleaning_room
    assert_response :success
  end

  test "should update cleaning_room" do
    patch :update, id: @cleaning_room, cleaning_room: { day: @cleaning_room.day, employee_id: @cleaning_room.employee_id, room_id: @cleaning_room.room_id }
    assert_redirected_to cleaning_room_path(assigns(:cleaning_room))
  end

  test "should destroy cleaning_room" do
    assert_difference('CleaningRoom.count', -1) do
      delete :destroy, id: @cleaning_room
    end

    assert_redirected_to cleaning_rooms_path
  end
end
