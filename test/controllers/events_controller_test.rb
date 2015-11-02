require 'test_helper'

class EventsControllerTest < ActionController::TestCase

  test 'should try to create heartbeat and return error for invalid token' do
    post :heartbeat, { name: 'server1', token: 'test111'}, format: :json
    assert_response 401
  end

  test 'should create heartbeat update ip and last_heartbeat' do
    post :heartbeat, { name: 'server1', token: 'test123'}, format: :json
    assert_response :success
  end

  test 'should create message event with valid token' do
    post :message, { message: 'Hello world!', name: 'server1', token: 'test123' }
    assert_response :success
  end
end