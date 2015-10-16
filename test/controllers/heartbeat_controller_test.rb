require 'test_helper'

class HeartbeatControllerTest < ActionController::TestCase
  test "should return error for invalid token" do
    post :create, { 'name' => 'server1', 'token' => 'test111'}, format: :json
    assert_response 401
  end

  test "should update ip and last_heartbeat" do
    post :create, { 'name' => 'server1', 'token' => 'test123'}, format: :json
    assert_response :success
  end

end
