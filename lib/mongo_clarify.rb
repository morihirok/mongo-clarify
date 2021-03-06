# frozen_string_literal: true

require 'mongo_clarify/version'

require_relative 'mongo_clarify/investigate'
require_relative 'mongo_clarify/output'

module MongoClarify
  class << self
    def run(explain)
      investigate = MongoClarify::Investigate.new(explain)
      exec_stats = investigate.execution_stats
      operation_method = investigate.operation_method

      MongoClarify::Output.new(operation_method, exec_stats).markdown_table
    end
  end
end
