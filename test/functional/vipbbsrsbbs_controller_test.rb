require 'test_helper'

class VipbbsrsbbsControllerTest < ActionController::TestCase
  setup do
    @vipbbsrsbb = vipbbsrsbbs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vipbbsrsbbs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vipbbsrsbb" do
    assert_difference('Vipbbsrsbb.count') do
      post :create, vipbbsrsbb: @vipbbsrsbb.attributes
    end

    assert_redirected_to vipbbsrsbb_path(assigns(:vipbbsrsbb))
  end

  test "should show vipbbsrsbb" do
    get :show, id: @vipbbsrsbb
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vipbbsrsbb
    assert_response :success
  end

  test "should update vipbbsrsbb" do
    put :update, id: @vipbbsrsbb, vipbbsrsbb: @vipbbsrsbb.attributes
    assert_redirected_to vipbbsrsbb_path(assigns(:vipbbsrsbb))
  end

  test "should destroy vipbbsrsbb" do
    assert_difference('Vipbbsrsbb.count', -1) do
      delete :destroy, id: @vipbbsrsbb
    end

    assert_redirected_to vipbbsrsbbs_path
  end
end
