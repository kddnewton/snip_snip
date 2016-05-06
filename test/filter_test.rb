require 'test_helper'

module SnipSnip
  class FilterTest < ActiveSupport::TestCase
    Post = Class.new
    Comment = Class.new

    test '#initialize' do
      assert_equal [ActiveRecord::InternalMetadata], Filter.new.filtered
    end

    test '#filtered?' do
      filter = Filter.new([Post])

      assert filter.filtered?(Post.new)
      refute filter.filtered?(Comment.new)
    end

    test '::filtered?' do
      record = Post.new
      mock = Minitest::Mock.new
      mock.expect(:filtered?, true, [record])

      Filter.stub(:instance, mock) do
        assert Filter.filtered?(record)
        mock.verify
      end
    end

    test '::instance' do
      assert_kind_of Filter, Filter.instance
    end
  end
end
