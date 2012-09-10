require 'test_helper'

class LbcsControllerTest < ActionController::TestCase
  setup do
    @lbc = lbcs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lbcs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lbc" do
    assert_difference('Lbc.count') do
      post :create, lbc: @lbc.attributes
    end

    assert_redirected_to lbc_path(assigns(:lbc))
  end

  test "should show lbc" do
    get :show, id: @lbc
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lbc
    assert_response :success
  end

  test "should update lbc" do
    put :update, id: @lbc, lbc: @lbc.attributes
    assert_redirected_to lbc_path(assigns(:lbc))
  end

  test "should destroy lbc" do
    assert_difference('Lbc.count', -1) do
      delete :destroy, id: @lbc
    end

    assert_redirected_to lbcs_path
  end
end
