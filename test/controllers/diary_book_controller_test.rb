require 'test_helper'

class DiaryBookControllerTest < ActionController::TestCase
  test "should get diario" do
    get :diario
    assert_response :success
  end

end
