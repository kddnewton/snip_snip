# frozen_string_literal: true

require 'test_helper'

module SnipSnip
  class RegistryTest < ActiveSupport::TestCase
    test '#clear' do
      registry = registry_with(%i[a b c])
      registry.clear

      assert_empty registry.records
    end

    test '#each_record no block' do
      expected = %i[a b c]
      registry = registry_with(expected)

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

    private

    def registry_with(records)
      registry = Registry.new
      registry.instance_variable_set(:@records, records)
      registry
    end
  end
end
