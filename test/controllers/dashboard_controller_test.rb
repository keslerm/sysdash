require 'test_helper'

class DashboardControllerTest < ActionController::TestCase
  test "unauthenticated access should redirect to login page" do
    get :index
    assert_response 302

    assert_redirected_to '/login'
  end

  test 'authenticated access should load dashboard' do
    get :index, nil, { user_id: '1'}

    assert_response :success
  end


end
