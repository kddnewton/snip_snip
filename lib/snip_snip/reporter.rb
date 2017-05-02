# frozen_string_literal: true

module SnipSnip
  class Reporter
    Result = Struct.new(:class_name, :primary_key, :unused) do
      def report
        @report ||= "#{class_name} #{primary_key}: #{unused.sort.join(', ')}"
      end
    end

    attr_accessor :results

    def initialize
      self.results = find_results
    end

    def report(controller)
      return if results.empty?

      SnipSnip.logger.info("#{controller.controller_name}##{controller.action_name}")
      results.sort_by(&:report).each do |result|
        SnipSnip.logger.info("  #{result.report}")
      end
    ensure
      Registry.clear
    end

    def self.report(controller)
      new.report(controller)
    end

    private

    def find_results
      Registry.each_record.each_with_object([]) do |record, records|
        accessed = record.accessed_fields
        unused = (record.attributes.keys - accessed)
        next if unused.empty?

        primary_key = record.class.primary_key
        records << Result.new(record.class.name, record.send(primary_key), unused)
      end
    end
  end
end
