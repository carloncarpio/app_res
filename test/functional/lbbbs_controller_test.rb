require 'test_helper'

class LbbbsControllerTest < ActionController::TestCase
  setup do
    @lbbb = lbbbs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lbbbs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lbbb" do
    assert_difference('Lbbb.count') do
      post :create, lbbb: @lbbb.attributes
    end

    assert_redirected_to lbbb_path(assigns(:lbbb))
  end

  test "should show lbbb" do
    get :show, id: @lbbb
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lbbb
    assert_response :success
  end

  test "should update lbbb" do
    put :update, id: @lbbb, lbbb: @lbbb.attributes
    assert_redirected_to lbbb_path(assigns(:lbbb))
  end

  test "should destroy lbbb" do
    assert_difference('Lbbb.count', -1) do
      delete :destroy, id: @lbbb
    end

    assert_redirected_to lbbbs_path
  end
end
