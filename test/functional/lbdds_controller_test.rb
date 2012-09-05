require 'test_helper'

class LbddsControllerTest < ActionController::TestCase
  setup do
    @lbdd = lbdds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lbdds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lbdd" do
    assert_difference('Lbdd.count') do
      post :create, lbdd: @lbdd.attributes
    end

    assert_redirected_to lbdd_path(assigns(:lbdd))
  end

  test "should show lbdd" do
    get :show, id: @lbdd
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lbdd
    assert_response :success
  end

  test "should update lbdd" do
    put :update, id: @lbdd, lbdd: @lbdd.attributes
    assert_redirected_to lbdd_path(assigns(:lbdd))
  end

  test "should destroy lbdd" do
    assert_difference('Lbdd.count', -1) do
      delete :destroy, id: @lbdd
    end

    assert_redirected_to lbdds_path
  end
end
