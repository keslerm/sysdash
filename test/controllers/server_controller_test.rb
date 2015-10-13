require 'test_helper'

class ServerControllerTest < ActionController::TestCase
  test "should get checkin" do
    get :checkin
    assert_response :success
  end

end
