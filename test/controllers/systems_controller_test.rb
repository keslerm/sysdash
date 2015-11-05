require 'test_helper'
require 'pp'

class SystemsControllerTest < ActionController::TestCase
  setup do
    @system = systems(:server1)
  end

  test 'unauthenticated access should redirect to login page' do
    get :new
    assert_response 302

    assert_redirected_to '/login'
  end

  test 'should get the list of systems' do
    get :index, nil, {user_id: 1}

    assert_response :success
    assert assigns(:systems)
  end

  test 'should get new' do
    get :new, nil, {user_id: 1}
    assert_response :success
  end

  test 'should create system' do
    assert_difference('System.count') do
      post :create, {system: {name: 'Test', token: '12345' }}, {user_id: 1}
    end

    assert_redirected_to systems_path
  end

  test 'should get edit' do
    get :edit, {id: @system}, {user_id: 1}
    assert_response :success
  end

  test 'should update system' do
    patch :update, {id: @system, system: {name: 'Test 2', token: '555' }}, {user_id: 1}
    assert_redirected_to systems_path
  end

  test 'should destroy system' do
    assert_difference('System.count', -1) do
      delete :destroy, { id: @system }, {user_id:  1 }
    end

    assert_redirected_to systems_path
  end

  test 'should get system details' do
    get :show, {id: @system}, {user_id: 1}
    assert_response :success
  end
end
