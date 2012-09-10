require 'test_helper'

class LbbsControllerTest < ActionController::TestCase
  setup do
    @lbb = lbbs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lbbs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lbb" do
    assert_difference('Lbb.count') do
      post :create, lbb: @lbb.attributes
    end

    assert_redirected_to lbb_path(assigns(:lbb))
  end

  test "should show lbb" do
    get :show, id: @lbb
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lbb
    assert_response :success
  end

  test "should update lbb" do
    put :update, id: @lbb, lbb: @lbb.attributes
    assert_redirected_to lbb_path(assigns(:lbb))
  end

  test "should destroy lbb" do
    assert_difference('Lbb.count', -1) do
      delete :destroy, id: @lbb
    end

    assert_redirected_to lbbs_path
  end
end
