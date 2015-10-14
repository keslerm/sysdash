require 'test_helper'

class DashboardControllerTest < ActionController::TestCase
  test "unauthenticated access should redirect to login page" do
    get :index
    assert_response 302

    assert_redirected_to '/login'
  end

end
