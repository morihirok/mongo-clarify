# frozen_string_literal: true

require 'JSON'
require_relative '../lib/mongo_clarify/investigate'

RSpec.describe MongoClarify::Investigate do
  it '#operation_method return COLLECTION SCAN' do
    file = File.read('./spec/collection_scan.json')
    explain = JSON.parse(file, symbolize_names: true)
    investigate = MongoClarify::Investigate.new(explain)

    expect(investigate.operation_method).to eq 'Collection Scan'
  end

  it '#operation_method return Index Scan with index name' do
    file = File.read('./spec/index_scan.json')
    explain = JSON.parse(file, symbolize_names: true)
    investigate = MongoClarify::Investigate.new(explain)

    expect(investigate.operation_method).to eq 'Index Scan (Index Name: price_1)'
  end

  it '#operation_method return Unknown' do
    investigate = MongoClarify::Investigate.new({})

    expect(investigate.operation_method).to eq 'Unknown'
  end
end
