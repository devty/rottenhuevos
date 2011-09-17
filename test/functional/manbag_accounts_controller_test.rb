require 'test_helper'

class ManbagAccountsControllerTest < ActionController::TestCase
  setup do
    @manbag_account = manbag_accounts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:manbag_accounts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create manbag_account" do
    assert_difference('ManbagAccount.count') do
      post :create, manbag_account: @manbag_account.attributes
    end

    assert_redirected_to manbag_account_path(assigns(:manbag_account))
  end

  test "should show manbag_account" do
    get :show, id: @manbag_account.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @manbag_account.to_param
    assert_response :success
  end

  test "should update manbag_account" do
    put :update, id: @manbag_account.to_param, manbag_account: @manbag_account.attributes
    assert_redirected_to manbag_account_path(assigns(:manbag_account))
  end

  test "should destroy manbag_account" do
    assert_difference('ManbagAccount.count', -1) do
      delete :destroy, id: @manbag_account.to_param
    end

    assert_redirected_to manbag_accounts_path
  end
end
