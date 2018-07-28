# frozen_string_literal: true

module SnipSnip
  # Classes to filter out of the tracking when looking at which columns were
  # selected.
  class Filter
    attr_reader :filtered

    def initialize(filtered = [])
      @filtered = filtered

      return unless ActiveRecord.const_defined?(:InternalMetadata)
      @filtered << ActiveRecord::InternalMetadata
    end

    def filtered?(record)
      filtered.any? { |filter| record.is_a?(filter) }
    end

    def self.filtered?(record)
      (@instance ||= new).filtered?(record)
    end
  end
end
