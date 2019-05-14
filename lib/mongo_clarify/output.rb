# frozen_string_literal: true

module MongoClarify
  class Output
    def initialize(operation_method, exec_stats)
      @operation_method = operation_method
      @exec_stats = exec_stats
    end

    def markdown_table
      if @operation_method.nil? && @exec_stats.nil?
        return puts 'Could not parse this explain...'
      elsif @exec_stats.nil?
        return puts means_of_operation_only_table(@operation_method)
      end
      puts full_table
    end

    private

    def full_table
      <<~EXPLAIN
        | Key | Value |
        | --- | --- |
        | Means of Operation  | #{@operation_method || 'Unknown'} |
        | nReturned           | #{@exec_stats[:n_returned]} |
        | executionTimeMillis | #{@exec_stats[:execution_time_millis]} msec |
        | totalKeysExamined   | #{@exec_stats[:total_keys_examined]} |
        | totalDocsExamined   | #{@exec_stats[:total_docs_examined]} |
      EXPLAIN
    end

    def means_of_operation_only_table(operation_method)
      <<~EXPLAIN
        | Key | Value |
        | --- | --- |
        | Means of Operation  | #{operation_method} |
        | Execution Stats     | Not detected |
      EXPLAIN
    end
  end
end
