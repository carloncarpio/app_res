require 'test_helper'

class SrsaasControllerTest < ActionController::TestCase
  setup do
    @srsaa = srsaas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:srsaas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create srsaa" do
    assert_difference('Srsaa.count') do
      post :create, srsaa: @srsaa.attributes
    end

    assert_redirected_to srsaa_path(assigns(:srsaa))
  end

  test "should show srsaa" do
    get :show, id: @srsaa
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @srsaa
    assert_response :success
  end

  test "should update srsaa" do
    put :update, id: @srsaa, srsaa: @srsaa.attributes
    assert_redirected_to srsaa_path(assigns(:srsaa))
  end

  test "should destroy srsaa" do
    assert_difference('Srsaa.count', -1) do
      delete :destroy, id: @srsaa
    end

    assert_redirected_to srsaas_path
  end
end
