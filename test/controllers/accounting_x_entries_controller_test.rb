require 'test_helper'

class AccountingXEntriesControllerTest < ActionController::TestCase
  setup do
    @accounting_x_entry = accounting_x_entries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:accounting_x_entries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create accounting_x_entry" do
    assert_difference('AccountingXEntry.count') do
      post :create, accounting_x_entry: { monto: @accounting_x_entry.monto, observacion: @accounting_x_entry.observacion }
    end

    assert_redirected_to accounting_x_entry_path(assigns(:accounting_x_entry))
  end

  test "should show accounting_x_entry" do
    get :show, id: @accounting_x_entry
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @accounting_x_entry
    assert_response :success
  end

  test "should update accounting_x_entry" do
    patch :update, id: @accounting_x_entry, accounting_x_entry: { monto: @accounting_x_entry.monto, observacion: @accounting_x_entry.observacion }
    assert_redirected_to accounting_x_entry_path(assigns(:accounting_x_entry))
  end

  test "should destroy accounting_x_entry" do
    assert_difference('AccountingXEntry.count', -1) do
      delete :destroy, id: @accounting_x_entry
    end

    assert_redirected_to accounting_x_entries_path
  end
end
