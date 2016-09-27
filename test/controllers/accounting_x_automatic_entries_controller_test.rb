require 'test_helper'

class AccountingXAutomaticEntriesControllerTest < ActionController::TestCase
  setup do
    @accounting_x_automatic_entry = accounting_x_automatic_entries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:accounting_x_automatic_entries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create accounting_x_automatic_entry" do
    assert_difference('AccountingXAutomaticEntry.count') do
      post :create, accounting_x_automatic_entry: {  }
    end

    assert_redirected_to accounting_x_automatic_entry_path(assigns(:accounting_x_automatic_entry))
  end

  test "should show accounting_x_automatic_entry" do
    get :show, id: @accounting_x_automatic_entry
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @accounting_x_automatic_entry
    assert_response :success
  end

  test "should update accounting_x_automatic_entry" do
    patch :update, id: @accounting_x_automatic_entry, accounting_x_automatic_entry: {  }
    assert_redirected_to accounting_x_automatic_entry_path(assigns(:accounting_x_automatic_entry))
  end

  test "should destroy accounting_x_automatic_entry" do
    assert_difference('AccountingXAutomaticEntry.count', -1) do
      delete :destroy, id: @accounting_x_automatic_entry
    end

    assert_redirected_to accounting_x_automatic_entries_path
  end
end
