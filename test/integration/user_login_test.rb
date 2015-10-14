require 'test_helper'

class UserLoginTest < ActionDispatch::IntegrationTest
  test 'login with invalid information' do
    get login_path
    assert_template 'sessions/new'
    post login_path, session: { email: '', password: ''}
    assert_template 'sessions/new'
    assert_not flash.empty?

    get root_path
    assert flash.empty?
  end

  test 'login with valid information' do
    get login_path
    assert_template 'sessions/new'
    post login_path, session: { email: 'test@test.com', password: 'password123'}
    assert_redirected_to '/dashboard/index'

    get '/dashboard/index'

    assert_response :success
  end
end

