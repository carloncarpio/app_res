require 'test_helper'

class LbasControllerTest < ActionController::TestCase
  setup do
    @lba = lbas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lbas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lba" do
    assert_difference('Lba.count') do
      post :create, lba: @lba.attributes
    end

    assert_redirected_to lba_path(assigns(:lba))
  end

  test "should show lba" do
    get :show, id: @lba
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lba
    assert_response :success
  end

  test "should update lba" do
    put :update, id: @lba, lba: @lba.attributes
    assert_redirected_to lba_path(assigns(:lba))
  end

  test "should destroy lba" do
    assert_difference('Lba.count', -1) do
      delete :destroy, id: @lba
    end

    assert_redirected_to lbas_path
  end
end
