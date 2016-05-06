require 'test_helper'

module SnipSnip
  class RegistryTest < ActiveSupport::TestCase

    test '#clear' do
      registry = Registry.new
      registry.records = [:a, :b, :c]

      registry.clear

      assert_empty registry.records
    end

    test '#each_record no block' do
      expected = [:a, :b, :c]
      registry = Registry.new
      registry.records = expected

      actual = []
      registry.each_record { |record| actual << record }

      assert_equal expected, actual
    end

    test '#each_record block' do
      registry = Registry.new

      assert_kind_of Enumerator, registry.each_record
    end

    test '#register' do
      registry = Registry.new

      registry.register(:a)

      assert_equal [:a], registry.records
    end

    test '::instance' do
      assert_kind_of Registry, Registry.instance
    end
  end
end
