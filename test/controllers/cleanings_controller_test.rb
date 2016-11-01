require 'test_helper'

class CleaningsControllerTest < ActionController::TestCase
  setup do
    @cleaning = cleanings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cleanings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cleaning" do
    assert_difference('Cleaning.count') do
      post :create, cleaning: { cleaning_room_id: @cleaning.cleaning_room_id, end: @cleaning.end, room_id: @cleaning.room_id, start: @cleaning.start, title: @cleaning.title }
    end

    assert_redirected_to cleaning_path(assigns(:cleaning))
  end

  test "should show cleaning" do
    get :show, id: @cleaning
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cleaning
    assert_response :success
  end

  test "should update cleaning" do
    patch :update, id: @cleaning, cleaning: { cleaning_room_id: @cleaning.cleaning_room_id, end: @cleaning.end, room_id: @cleaning.room_id, start: @cleaning.start, title: @cleaning.title }
    assert_redirected_to cleaning_path(assigns(:cleaning))
  end

  test "should destroy cleaning" do
    assert_difference('Cleaning.count', -1) do
      delete :destroy, id: @cleaning
    end

    assert_redirected_to cleanings_path
  end
end
