require 'test_helper'

module SnipSnip
  class ReporterTest < ActiveSupport::TestCase
    FakeController = Struct.new(:controller_name, :action_name)
    FakeResult = Struct.new(:report)

    test '::find_records' do
      first_user, second_user = [User.first, User.second]
      [first_user.id, first_user.created_at, first_user.updated_at]
      [second_user.first_name, second_user.last_name]

      found = Reporter.find_records

      assert_equal 2, found.length
      assert_equal %w[first_name last_name], found.first.unused.sort
      assert_equal %w[created_at id updated_at], found.second.unused.sort
    end

    test '::report none' do
      assert_logged([]) { Reporter.report(nil) }
    end

    test '::report many' do
      Reporter.stub(:find_records, [FakeResult.new('1'), FakeResult.new('2')]) do
        expected = ['c#a', '  1', '  2']
        assert_logged(expected) { Reporter.report(FakeController.new('c', 'a')) }
      end
    end
  end
end
