require 'test_helper'

class MessagesControllerTest < ActionController::TestCase

  test 'should get list of messages for a system' do
    get :index, nil, {user_id: 1}
  end
end
