require 'test_helper'

class LedgerControllerTest < ActionController::TestCase
  test "should get mayor" do
    get :mayor
    assert_response :success
  end

end
