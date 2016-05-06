# frozen_string_literal: true
module SnipSnip
  class Reporter
    Result = Struct.new(:class_name, :primary_key, :unused) do
      def report
        @report ||= "#{class_name} #{primary_key}: #{unused.sort.join(', ')}"
      end
    end

    class << self
      def find_records
        Registry.each_record.each_with_object([]) do |record, records|
          accessed = record.accessed_fields
          unused = (record.attributes.keys - accessed)
          next if unused.empty?

          primary_key = record.class.primary_key
          records << Result.new(record.class.name, record.send(primary_key), unused)
        end
      end

      def report(controller)
        found = find_records
        return if found.empty?
        SnipSnip.logger.info("#{controller.controller_name}##{controller.action_name}")
        found.sort_by(&:report).each { |result| SnipSnip.logger.info("  #{result.report}") }
      ensure
        Registry.clear
      end
    end
  end
end
