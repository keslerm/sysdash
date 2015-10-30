require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  test "should get create" do
    post :create, { 'message': 'Hello world!', 'name': 'server1', 'token': 'test123' }
    assert_response :success
  end

end