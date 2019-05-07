require 'test/unit/autorunner'
require 'JSON'

require_relative '../lib/mongo-clarify/investigate'

class InvestigateTest < Test::Unit::TestCase

  test '#operation_method return COLLECTION SCAN' do
    file = File.read('./test/collection_scan.json')
    explain = JSON.parse(file, symbolize_names: true)
    investigate = MongoClarify::Investigate.new(explain)

    assert_equal('Collection Scan', investigate.operation_method)
  end

  test '#operation_method return Index Scan with index name' do
    file = File.read('./test/index_scan.json')
    explain = JSON.parse(file, symbolize_names: true)
    investigate = MongoClarify::Investigate.new(explain)

    assert_equal('Index Scan (Index Name: price_1)', investigate.operation_method)
  end

  test '#operation_method return Unknown' do
    investigate = MongoClarify::Investigate.new({})

    assert_equal('Unknown', investigate.operation_method)
  end
end
