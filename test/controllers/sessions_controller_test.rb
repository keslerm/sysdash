require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test 'should destroy session on logout' do
    get :destroy, nil, {user_id: 1}
    assert_redirected_to '/login'

    assert_same nil, session[:user_id]
  end
end
