require 'test_helper'

class IntegrationTest < ActionDispatch::IntegrationTest

  test 'GET /action1' do
    assert_logged([]) { get action1_path }
  end

  test 'GET /action2' do
    expected = [
      'users#action2',
      '  User 1: created_at, first_name, id, last_name, updated_at',
      '  User 2: created_at, first_name, id, last_name, updated_at'
    ]
    assert_logged(expected) { get action2_path }
  end
end
