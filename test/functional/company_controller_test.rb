require 'test_helper'

class CompanyControllerTest < ActionController::TestCase
  test "should get show_comp" do
    get :show_comp
    assert_response :success
  end

end
