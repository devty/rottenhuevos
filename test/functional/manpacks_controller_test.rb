require 'test_helper'

class ManpacksControllerTest < ActionController::TestCase
  setup do
    @manpack = manpacks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:manpacks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create manpack" do
    assert_difference('Manpack.count') do
      post :create, manpack: @manpack.attributes
    end

    assert_redirected_to manpack_path(assigns(:manpack))
  end

  test "should show manpack" do
    get :show, id: @manpack.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @manpack.to_param
    assert_response :success
  end

  test "should update manpack" do
    put :update, id: @manpack.to_param, manpack: @manpack.attributes
    assert_redirected_to manpack_path(assigns(:manpack))
  end

  test "should destroy manpack" do
    assert_difference('Manpack.count', -1) do
      delete :destroy, id: @manpack.to_param
    end

    assert_redirected_to manpacks_path
  end
end
