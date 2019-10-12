# frozen_string_literal: true

require 'JSON'
require_relative '../../lib/mongo_clarify/investigate'

RSpec.describe MongoClarify::Investigate do
  describe '#operation_method' do
    subject { investigate.operation_method }
    let(:investigate) { MongoClarify::Investigate.new(explain) }
    let(:explain) { JSON.parse(file, symbolize_names: true) }

    context 'When pattern of explain json is collection scan' do
      let(:file) { File.read('./spec/collection_scan.json') }

      it { is_expected.to eq 'Collection Scan' }
    end

    context 'When pattern of explain json is index scan' do
      let(:file) { File.read('./spec/index_scan.json') }

      it { is_expected.to eq 'Index Scan (Index Name: price_1)' }
    end

    context 'When does not match any pattern' do
      let(:investigate) { MongoClarify::Investigate.new({}) }

      it { is_expected.to be nil }
    end
  end

  describe '#execution_stats' do
    subject { investigate.execution_stats }
    let(:investigate) { MongoClarify::Investigate.new(explain) }
    let(:explain) { JSON.parse(file, symbolize_names: true) }

    context 'When pattern of explain json is collection scan' do
      let(:file) { File.read('./spec/collection_scan.json') }

      it {
        is_expected.to eq(
          n_returned: 1,
          execution_time_millis: 59,
          total_keys_examined: 0,
          total_docs_examined: 100_000
        )
      }
    end

    context 'When pattern of explain json is index scan' do
      let(:file) { File.read('./spec/index_scan.json') }

      it {
        is_expected.to eq(
          n_returned: 1,
          execution_time_millis: 13,
          total_keys_examined: 1,
          total_docs_examined: 1
        )
      }
    end

    context 'When does not match any pattern' do
      let(:investigate) { MongoClarify::Investigate.new({}) }

      it { is_expected.to be nil }
    end
  end
end
