# frozen_string_literal: true

module MongoClarify
  class Investigate
    def initialize(explain)
      @explain = explain
    end

    def operation_method
      if @explain[:queryPlanner]
        if @explain[:queryPlanner][:winningPlan][:stage] == 'COLLSCAN'
          'Collection Scan'
        elsif @explain[:queryPlanner][:winningPlan][:stage] == 'FETCH'
          if @explain[:queryPlanner][:winningPlan][:inputStage][:stage] == 'IXSCAN'
            "Index Scan (Index Name: #{@explain[:queryPlanner][:winningPlan][:inputStage][:indexName]})"
          end
        end
      else
        'Unknown'
      end
    end

    def execution_stats
      if @explain[:executionStats]
        { n_returned: @explain[:executionStats][:nReturned], execution_time_millis: @explain[:executionStats][:executionTimeMillis], total_keys_examined: @explain[:executionStats][:totalKeysExamined], total_docs_examined: @explain[:executionStats][:totalDocsExamined] }
      else
        { n_returned: nil, execution_time_millis: nil, total_keys_examined: nil, total_docs_examined: nil }
      end
    end
  end
end
