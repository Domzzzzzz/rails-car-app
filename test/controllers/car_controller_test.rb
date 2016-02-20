require 'test_helper'

class CarControllerTest < ActionController::TestCase
  test "should get my_auto" do
    get :my_auto
    assert_response :success
  end

end
