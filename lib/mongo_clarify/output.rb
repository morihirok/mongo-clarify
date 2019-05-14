# frozen_string_literal: true

module MongoClarify
  class Output
    def initialize(operation_method, exec_stats)
      @operation_method = operation_method
      @exec_stats = exec_stats
    end

    def markdown_table
      puts <<~EXPLAIN
        | Key | Value |
        | --- | --- |
        | Means of Operation  | #{@operation_method || 'Unknown'} |
        | nReturned           | #{@exec_stats[:n_returned]} |
        | executionTimeMillis | #{@exec_stats[:execution_time_millis]} msec |
        | totalKeysExamined   | #{@exec_stats[:total_keys_examined]} |
        | totalDocsExamined   | #{@exec_stats[:total_docs_examined]} |
      EXPLAIN
    end
  end
end
