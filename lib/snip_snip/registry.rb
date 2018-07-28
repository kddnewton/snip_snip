# frozen_string_literal: true

module SnipSnip
  # A list of records that were found during the course of the last request
  # on which we are tracking columns.
  class Registry
    attr_reader :records

    def initialize
      clear
    end

    # Wipe the registry clear of found objects so that we don't report on them
    # twice.
    def clear
      @records = []
    end

    # Loop through each record that was found during the lifespan of this
    # registry
    def each_record(&block)
      return to_enum(:each_record) unless block_given?
      records.each(&block)
    end

    # Add a record to this registry
    def register(record)
      records << record
    end

    class << self
      # The singleton instance of this registry.
      def instance
        @instance ||= new
      end

      # Delegate all missing methods to the singleton instance.
      def method_missing(method, *args, &block)
        return super unless respond_to_missing?(method)
        instance.public_send(method, *args, &block)
      end

      # Respond to all of the missing methods on the singleton instance.
      def respond_to_missing?(method)
        instance.respond_to?(method)
      end
    end
  end
end
