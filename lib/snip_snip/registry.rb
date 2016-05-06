# frozen_string_literal: true
module SnipSnip
  class Registry

    attr_accessor :records

    def initialize
      clear
    end

    def clear
      self.records = []
    end

    def each_record(&block)
      return to_enum(:each_record) unless block_given?
      records.each(&block)
    end

    def register(record)
      records << record
    end

    class << self
      extend Forwardable
      def_delegators :instance, :clear, :each_record, :register

      def instance
        @instance ||= new
      end
    end
  end
end
