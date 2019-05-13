# frozen_string_literal: true

require 'test_helper'

module SnipSnip
  class ReporterTest < ActiveSupport::TestCase
    FakeController = Struct.new(:controller_name, :action_name)
    FakeResult = Struct.new(:report)

    test '#initialize' do
      first_user = User.first
      second_user = User.second

      first_user.id
      first_user.created_at
      first_user.updated_at
      second_user.first_name
      second_user.last_name

      results = Reporter.new.results

      assert_equal 2, results.length
      assert_equal %w[first_name last_name], results.first.unused.sort
      assert_equal %w[created_at id updated_at], results.second.unused.sort
    end

    test '#report none' do
      assert_logged([]) { Reporter.new.report(nil) }
    end

    test '#report some' do
      reporter = Reporter.new
      results = [FakeResult.new('1'), FakeResult.new('2')]
      reporter.instance_variable_set(:@results, results)

      expected = ['c#a', '  1', '  2']
      assert_logged(expected) { reporter.report(FakeController.new('c', 'a')) }
    end
  end
end
