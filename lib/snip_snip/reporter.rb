module SnipSnip
  # Handles outputting unnecessarily selected columns to the logs.
  class Reporter
    # Represents a result that has unused columns.
    Result =
      Struct.new(:class_name, :primary_key, :unused) do
        # A string representing the unused columns for the given record.
        def report
          @report ||= "#{class_name} #{primary_key}: #{unused.sort.join(', ')}"
        end
      end

    attr_reader :results

    def initialize
      @results = find_results
    end

    # Report on the unused columns that were selected during the course of the
    # processing the action on the given controller.
    def report(controller)
      return if results.empty?

      action_display = "#{controller.controller_name}##{controller.action_name}"
      SnipSnip.logger.info(action_display)

      results.sort_by(&:report).each do |result|
        SnipSnip.logger.info("  #{result.report}")
      end
    ensure
      Registry.clear
    end

    # Report on the specified controller.
    def self.report(controller)
      new.report(controller)
    end

    private

    def find_results
      Registry.each_record.each_with_object([]) do |record, records|
        accessed = record.accessed_fields
        unused = (record.attributes.keys - accessed)
        records << result_from(record, unused) if unused.any?
      end
    end

    def result_from(record, unused)
      primary_key = record.class.primary_key
      Result.new(record.class.name, record.public_send(primary_key), unused)
    end
  end
end
