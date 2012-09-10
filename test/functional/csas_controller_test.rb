require 'test_helper'

class CsasControllerTest < ActionController::TestCase
  setup do
    @csa = csas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:csas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create csa" do
    assert_difference('Csa.count') do
      post :create, csa: @csa.attributes
    end

    assert_redirected_to csa_path(assigns(:csa))
  end

  test "should show csa" do
    get :show, id: @csa
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @csa
    assert_response :success
  end

  test "should update csa" do
    put :update, id: @csa, csa: @csa.attributes
    assert_redirected_to csa_path(assigns(:csa))
  end

  test "should destroy csa" do
    assert_difference('Csa.count', -1) do
      delete :destroy, id: @csa
    end

    assert_redirected_to csas_path
  end
end
