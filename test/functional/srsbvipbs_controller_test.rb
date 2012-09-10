require 'test_helper'

class SrsbvipbsControllerTest < ActionController::TestCase
  setup do
    @srsbvipb = srsbvipbs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:srsbvipbs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create srsbvipb" do
    assert_difference('Srsbvipb.count') do
      post :create, srsbvipb: @srsbvipb.attributes
    end

    assert_redirected_to srsbvipb_path(assigns(:srsbvipb))
  end

  test "should show srsbvipb" do
    get :show, id: @srsbvipb
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @srsbvipb
    assert_response :success
  end

  test "should update srsbvipb" do
    put :update, id: @srsbvipb, srsbvipb: @srsbvipb.attributes
    assert_redirected_to srsbvipb_path(assigns(:srsbvipb))
  end

  test "should destroy srsbvipb" do
    assert_difference('Srsbvipb.count', -1) do
      delete :destroy, id: @srsbvipb
    end

    assert_redirected_to srsbvipbs_path
  end
end
