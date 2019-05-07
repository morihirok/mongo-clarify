# frozen_string_literal: true

module MongoClarify
  class InvestigateRuby2_7
    def initialize(explain)
      @explain = explain
    end

    def operation_method
      case @explain
      in { queryPlanner: { winningPlan: { stage: 'COLLSCAN' } } }
        'Collection Scan'
      in { queryPlanner: { winningPlan: { stage: 'FETCH', inputStage: { stage: 'IXSCAN', indexName: index_name } } } }
        "Index Scan (Index Name: #{index_name})"
      else
        'Unknown'
      end
    end

    def execution_stats
      case @explain
      in { executionStats: { nReturned: n, executionTimeMillis: msec, totalKeysExamined: keys, totalDocsExamined: docs } }
      else
      end
      { n_returned: n, execution_time_millis: msec, total_keys_examined: keys, total_docs_examined: docs }
    end
  end
end
