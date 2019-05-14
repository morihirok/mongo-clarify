# frozen_string_literal: true

require_relative '../../lib/mongo_clarify/output'

RSpec.describe MongoClarify::Output do
  describe '#markdown_table' do
    let(:instance) { MongoClarify::Output.new(operation_method, exec_stats) }

    context 'When given correct args' do
      let(:operation_method) { 'Collection Scan' }
      let(:exec_stats) do
        {
          n_returned: 1,
          execution_time_millis: 10,
          total_keys_examined: 0,
          total_docs_examined: 100
        }
      end
      let(:result) do
        <<~RESULT
          | Key | Value |
          | --- | --- |
          | Means of Operation  | #{operation_method} |
          | nReturned           | #{exec_stats[:n_returned]} |
          | executionTimeMillis | #{exec_stats[:execution_time_millis]} msec |
          | totalKeysExamined   | #{exec_stats[:total_keys_examined]} |
          | totalDocsExamined   | #{exec_stats[:total_docs_examined]} |
        RESULT
      end

      it 'displays markdown table to stdout' do
        expect { instance.markdown_table }.to output(result).to_stdout
      end
    end

    context 'When operation_method is nil' do
      let(:operation_method) { nil }
      let(:exec_stats) do
        {
          n_returned: 1,
          execution_time_millis: 10,
          total_keys_examined: 0,
          total_docs_examined: 100
        }
      end
      let(:result) do
        <<~RESULT
          | Key | Value |
          | --- | --- |
          | Means of Operation  | Unknown |
          | nReturned           | #{exec_stats[:n_returned]} |
          | executionTimeMillis | #{exec_stats[:execution_time_millis]} msec |
          | totalKeysExamined   | #{exec_stats[:total_keys_examined]} |
          | totalDocsExamined   | #{exec_stats[:total_docs_examined]} |
        RESULT
      end

      it 'displays markdown table to stdout' do
        expect { instance.markdown_table }.to output(result).to_stdout
      end
    end
  end
end
