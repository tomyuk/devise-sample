require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get indes" do
    get :indes
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

end
