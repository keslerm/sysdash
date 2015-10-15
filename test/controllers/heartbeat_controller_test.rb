require 'test_helper'

class HeartbeatControllerTest < ActionController::TestCase
  test "should get beat" do
    get :beat
    assert_response :success
  end

end
