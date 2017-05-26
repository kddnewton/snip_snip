module SnipSnip
  class Filter
    attr_accessor :filtered

    def initialize(filtered = [])
      filtered << ActiveRecord::InternalMetadata if ActiveRecord.const_defined?(:InternalMetadata)
      self.filtered = filtered
    end

    def filtered?(record)
      filtered.any? { |filter| record.is_a?(filter) }
    end

    class << self
      def filtered?(record)
        instance.filtered?(record)
      end

      def instance
        @instance ||= new
      end
    end
  end
end
