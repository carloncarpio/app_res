require 'test_helper'

class VipasrsasControllerTest < ActionController::TestCase
  setup do
    @vipasrsa = vipasrsas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vipasrsas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vipasrsa" do
    assert_difference('Vipasrsa.count') do
      post :create, vipasrsa: @vipasrsa.attributes
    end

    assert_redirected_to vipasrsa_path(assigns(:vipasrsa))
  end

  test "should show vipasrsa" do
    get :show, id: @vipasrsa
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vipasrsa
    assert_response :success
  end

  test "should update vipasrsa" do
    put :update, id: @vipasrsa, vipasrsa: @vipasrsa.attributes
    assert_redirected_to vipasrsa_path(assigns(:vipasrsa))
  end

  test "should destroy vipasrsa" do
    assert_difference('Vipasrsa.count', -1) do
      delete :destroy, id: @vipasrsa
    end

    assert_redirected_to vipasrsas_path
  end
end
