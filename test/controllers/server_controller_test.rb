require 'test_helper'

class ServerControllerTest < ActionController::TestCase
  test "should get Checkin" do
    get :Checkin
    assert_response :success
  end

end
