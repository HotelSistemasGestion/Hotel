
require 'test_helper'

class AccountingAccountsControllerTest < ActionController::TestCase
  setup do
    @accounting_account = accounting_accounts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:accounting_accounts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create accounting_account" do
    assert_difference('AccountingAccount.count') do
      post :create, accounting_account: { grupo: @accounting_account.grupo, imputable: @accounting_account.imputable, nombre: @accounting_account.nombre }
    end

    assert_redirected_to accounting_account_path(assigns(:accounting_account))
  end

  test "should show accounting_account" do
    get :show, id: @accounting_account
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @accounting_account
    assert_response :success
  end

  test "should update accounting_account" do
    patch :update, id: @accounting_account, accounting_account: { grupo: @accounting_account.grupo, imputable: @accounting_account.imputable, nombre: @accounting_account.nombre }
    assert_redirected_to accounting_account_path(assigns(:accounting_account))
  end

  test "should destroy accounting_account" do
    assert_difference('AccountingAccount.count', -1) do
      delete :destroy, id: @accounting_account
    end

    assert_redirected_to accounting_accounts_path
  end
end

require 'test_helper'

class AccountingAccountsControllerTest < ActionController::TestCase
  setup do
    @accounting_account = accounting_accounts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:accounting_accounts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create accounting_account" do
    assert_difference('AccountingAccount.count') do
      post :create, accounting_account: { imputable: @accounting_account.imputable, nombre: @accounting_account.nombre }
    end

    assert_redirected_to accounting_account_path(assigns(:accounting_account))
  end

  test "should show accounting_account" do
    get :show, id: @accounting_account
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @accounting_account
    assert_response :success
  end

  test "should update accounting_account" do
    patch :update, id: @accounting_account, accounting_account: { imputable: @accounting_account.imputable, nombre: @accounting_account.nombre }
    assert_redirected_to accounting_account_path(assigns(:accounting_account))
  end

  test "should destroy accounting_account" do
    assert_difference('AccountingAccount.count', -1) do
      delete :destroy, id: @accounting_account
    end

    assert_redirected_to accounting_accounts_path
  end
end

