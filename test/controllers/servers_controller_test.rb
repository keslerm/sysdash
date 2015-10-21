require 'test_helper'
require 'pp'

class ServersControllerTest < ActionController::TestCase
  setup do
    @server = servers(:server1)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create server' do
    assert_difference('Server.count') do
      post :create, server: { name: 'Test', token: '12345' }
    end

    assert_redirected_to '/'
  end

  test 'should get edit' do
    get :edit, id: @server
    assert_response :success
  end

  test 'should update server' do
    patch :update, id: @server, server: { name: 'Test 2', token: '555' }
    assert_redirected_to '/'
  end

  test 'should destroy server' do
    assert_difference('Server.count', -1) do
      delete :destroy, id: @server
    end

    assert_redirected_to '/'
  end

  test 'should assign the last 5 cpu heart beats' do
    get :show, id: @server.id

    assert assigns :cpu_data
    assert_same 5, assigns['cpu_data'].length
    assert_same 100.0, assigns['cpu_data'].last
  end
end
