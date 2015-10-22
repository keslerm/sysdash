require 'test_helper'
require 'pp'

class ServersControllerTest < ActionController::TestCase
  setup do
    @server = servers(:server1)
  end

  test 'unauthenticated access should redirect to login page' do
    get :new
    assert_response 302

    assert_redirected_to '/login'
  end

  test 'should get the list of servers' do
    get :index, nil, {user_id: 1}

    assert_response :success
    assert assigns(:servers)
  end

  test 'should get new' do
    get :new, nil, {user_id: 1}
    assert_response :success
  end

  test 'should create server' do
    assert_difference('Server.count') do
      post :create, {server: { name: 'Test', token: '12345' }}, { user_id: 1}
    end

    assert_redirected_to '/'
  end

  test 'should get edit' do
    get :edit, {id: @server}, {user_id: 1}
    assert_response :success
  end

  test 'should update server' do
    patch :update, {id: @server, server: { name: 'Test 2', token: '555' }}, {user_id: 1}
    assert_redirected_to '/'
  end

  test 'should destroy server' do
    assert_difference('Server.count', -1) do
      delete :destroy, { id: @server }, { user_id:  1 }
    end

    assert_redirected_to '/'
  end

  test 'should assign the last 5 cpu heart beats' do
    get :show, {id: @server.id}, {user_id: 1}

    assert assigns :cpu_data
    assert assigns :memory_data
    assert_same 6, assigns['cpu_data'].length
    assert_same 6, assigns['memory_data'].length
    assert_same 100.0, assigns['cpu_data'].last
  end
end
