require 'test_helper'

class TypeOfRoomsControllerTest < ActionController::TestCase
  setup do
    @type_of_room = type_of_rooms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:type_of_rooms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create type_of_room" do
    assert_difference('TypeOfRoom.count') do
      post :create, type_of_room: { descripcion: @type_of_room.descripcion, tipo: @type_of_room.tipo }
    end

    assert_redirected_to type_of_room_path(assigns(:type_of_room))
  end

  test "should show type_of_room" do
    get :show, id: @type_of_room
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @type_of_room
    assert_response :success
  end

  test "should update type_of_room" do
    patch :update, id: @type_of_room, type_of_room: { descripcion: @type_of_room.descripcion, tipo: @type_of_room.tipo }
    assert_redirected_to type_of_room_path(assigns(:type_of_room))
  end

  test "should destroy type_of_room" do
    assert_difference('TypeOfRoom.count', -1) do
      delete :destroy, id: @type_of_room
    end

    assert_redirected_to type_of_rooms_path
  end
end
