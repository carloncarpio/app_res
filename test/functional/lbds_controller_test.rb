require 'test_helper'

class LbdsControllerTest < ActionController::TestCase
  setup do
    @lbd = lbds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lbds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lbd" do
    assert_difference('Lbd.count') do
      post :create, lbd: @lbd.attributes
    end

    assert_redirected_to lbd_path(assigns(:lbd))
  end

  test "should show lbd" do
    get :show, id: @lbd
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lbd
    assert_response :success
  end

  test "should update lbd" do
    put :update, id: @lbd, lbd: @lbd.attributes
    assert_redirected_to lbd_path(assigns(:lbd))
  end

  test "should destroy lbd" do
    assert_difference('Lbd.count', -1) do
      delete :destroy, id: @lbd
    end

    assert_redirected_to lbds_path
  end
end
