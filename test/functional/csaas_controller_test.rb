require 'test_helper'

class CsaasControllerTest < ActionController::TestCase
  setup do
    @csaa = csaas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:csaas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create csaa" do
    assert_difference('Csaa.count') do
      post :create, csaa: @csaa.attributes
    end

    assert_redirected_to csaa_path(assigns(:csaa))
  end

  test "should show csaa" do
    get :show, id: @csaa
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @csaa
    assert_response :success
  end

  test "should update csaa" do
    put :update, id: @csaa, csaa: @csaa.attributes
    assert_redirected_to csaa_path(assigns(:csaa))
  end

  test "should destroy csaa" do
    assert_difference('Csaa.count', -1) do
      delete :destroy, id: @csaa
    end

    assert_redirected_to csaas_path
  end
end
