require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test 'unauthenticated access should redirect to login page' do
    get :index
    assert_response 302

    assert_redirected_to '/login'
  end

  test 'should get index' do
    get :index, nil, {user_id: 1}
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test 'should get new' do
    get :new, nil, {user_id: 1}
    assert_response :success
  end

  test 'should create user' do
    assert_difference('User.count') do
      post :create, {user: {email: 'test@test.com', password: 'password1'}}, {user_id: 1}
    end

    assert_redirected_to assigns(:users)
  end

  test 'should show user' do
    get :show, {id: @user}, {user_id: 1}
    assert_response :success
  end

  test 'should get edit' do
    get :edit, {id: @user}, {user_id: 1}
    assert_response :success
  end

  test 'should update user' do
    patch :update, {id: @user, user: {id: 1, email: 'user@email.com', password: '12345'}}, {user_id: 1}
    assert_redirected_to users_path
  end

  test 'should destroy user' do
    assert_difference('User.count', -1) do
      delete :destroy, {id: @user}, {user_id: 1}
    end

    assert_redirected_to users_path
  end
end
