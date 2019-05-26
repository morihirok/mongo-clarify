# frozen_string_literal: true

require 'pattern-match/experimental'

module MongoClarify
  class Investigate
    using PatternMatch

    def initialize(explain)
      @explain = explain
    end

    def operation_method
      match(@explain) do
        with(Hash.(queryPlanner: Hash.(winningPlan: Hash.(stage: 'COLLSCAN')))) do
          'Collection Scan'
        end
        with(Hash.(queryPlanner: Hash.(winningPlan: Hash.(stage: 'FETCH', inputStage: Hash.(stage: 'IXSCAN', indexName: index_name))))) do
          "Index Scan (Index Name: #{index_name})"
        end
      end
    rescue PatternMatch::NoMatchingPatternError
      nil
    end

    def execution_stats
      match(@explain) do
        with(Hash.(executionStats: Hash.(nReturned: n, executionTimeMillis: msec, totalKeysExamined: keys, totalDocsExamined: docs))) do
          {
            n_returned: n,
            execution_time_millis: msec,
            total_keys_examined: keys,
            total_docs_examined: docs
          }
        end
      end
    rescue PatternMatch::NoMatchingPatternError
      nil
    end
  end
end
