require 'test_helper'

class SrsasControllerTest < ActionController::TestCase
  setup do
    @srsa = srsas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:srsas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create srsa" do
    assert_difference('Srsa.count') do
      post :create, srsa: @srsa.attributes
    end

    assert_redirected_to srsa_path(assigns(:srsa))
  end

  test "should show srsa" do
    get :show, id: @srsa
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @srsa
    assert_response :success
  end

  test "should update srsa" do
    put :update, id: @srsa, srsa: @srsa.attributes
    assert_redirected_to srsa_path(assigns(:srsa))
  end

  test "should destroy srsa" do
    assert_difference('Srsa.count', -1) do
      delete :destroy, id: @srsa
    end

    assert_redirected_to srsas_path
  end
end
