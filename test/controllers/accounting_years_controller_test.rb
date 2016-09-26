require 'test_helper'

class AccountingYearsControllerTest < ActionController::TestCase
  setup do
    @accounting_year = accounting_years(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:accounting_years)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create accounting_year" do
    assert_difference('AccountingYear.count') do
      post :create, accounting_year: { anho: @accounting_year.anho, estado: @accounting_year.estado }
    end

    assert_redirected_to accounting_year_path(assigns(:accounting_year))
  end

  test "should show accounting_year" do
    get :show, id: @accounting_year
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @accounting_year
    assert_response :success
  end

  test "should update accounting_year" do
    patch :update, id: @accounting_year, accounting_year: { anho: @accounting_year.anho, estado: @accounting_year.estado }
    assert_redirected_to accounting_year_path(assigns(:accounting_year))
  end

  test "should destroy accounting_year" do
    assert_difference('AccountingYear.count', -1) do
      delete :destroy, id: @accounting_year
    end

    assert_redirected_to accounting_years_path
  end
end
