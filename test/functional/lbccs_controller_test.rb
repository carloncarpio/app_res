require 'test_helper'

class LbccsControllerTest < ActionController::TestCase
  setup do
    @lbcc = lbccs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lbccs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lbcc" do
    assert_difference('Lbcc.count') do
      post :create, lbcc: @lbcc.attributes
    end

    assert_redirected_to lbcc_path(assigns(:lbcc))
  end

  test "should show lbcc" do
    get :show, id: @lbcc
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lbcc
    assert_response :success
  end

  test "should update lbcc" do
    put :update, id: @lbcc, lbcc: @lbcc.attributes
    assert_redirected_to lbcc_path(assigns(:lbcc))
  end

  test "should destroy lbcc" do
    assert_difference('Lbcc.count', -1) do
      delete :destroy, id: @lbcc
    end

    assert_redirected_to lbccs_path
  end
end
