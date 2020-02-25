# frozen_string_literal: true

require 'test_helper'

module SnipSnip
  class FilterTest < ActiveSupport::TestCase
    Post = Class.new
    Comment = Class.new

    class FilterDouble
      def filtered?(_record)
        true
      end
    end

    clear = -> { Filter.instance_variable_set(:@instance, nil) }
    setup(&clear)
    teardown(&clear)

    test '#initialize' do
      assert_equal [ActiveRecord::InternalMetadata], Filter.new.filtered
    end

    test '#initialize with no internal metadata' do
      internal_metadata = ActiveRecord::InternalMetadata

      begin
        ActiveRecord.send(:remove_const, :InternalMetadata)
        assert_empty Filter.new.filtered
      ensure
        ActiveRecord.const_set(:InternalMetadata, internal_metadata)
      end
    end

    test '#filtered?' do
      filter = Filter.new([Post])

      assert filter.filtered?(Post.new)
      refute filter.filtered?(Comment.new)
    end

    test '::filtered?' do
      record = Post.new

      Filter.stub(:new, FilterDouble.new) do
        assert Filter.filtered?(record)
      end
    end
  end
end
