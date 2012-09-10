require 'test_helper'

class LbaasControllerTest < ActionController::TestCase
  setup do
    @lbaa = lbaas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lbaas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lbaa" do
    assert_difference('Lbaa.count') do
      post :create, lbaa: @lbaa.attributes
    end

    assert_redirected_to lbaa_path(assigns(:lbaa))
  end

  test "should show lbaa" do
    get :show, id: @lbaa
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lbaa
    assert_response :success
  end

  test "should update lbaa" do
    put :update, id: @lbaa, lbaa: @lbaa.attributes
    assert_redirected_to lbaa_path(assigns(:lbaa))
  end

  test "should destroy lbaa" do
    assert_difference('Lbaa.count', -1) do
      delete :destroy, id: @lbaa
    end

    assert_redirected_to lbaas_path
  end
end
