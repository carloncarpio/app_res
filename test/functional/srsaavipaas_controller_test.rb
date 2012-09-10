require 'test_helper'

class SrsaavipaasControllerTest < ActionController::TestCase
  setup do
    @srsaavipaa = srsaavipaas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:srsaavipaas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create srsaavipaa" do
    assert_difference('Srsaavipaa.count') do
      post :create, srsaavipaa: @srsaavipaa.attributes
    end

    assert_redirected_to srsaavipaa_path(assigns(:srsaavipaa))
  end

  test "should show srsaavipaa" do
    get :show, id: @srsaavipaa
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @srsaavipaa
    assert_response :success
  end

  test "should update srsaavipaa" do
    put :update, id: @srsaavipaa, srsaavipaa: @srsaavipaa.attributes
    assert_redirected_to srsaavipaa_path(assigns(:srsaavipaa))
  end

  test "should destroy srsaavipaa" do
    assert_difference('Srsaavipaa.count', -1) do
      delete :destroy, id: @srsaavipaa
    end

    assert_redirected_to srsaavipaas_path
  end
end
