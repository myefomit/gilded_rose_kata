# frozen_string_literal: true

require_relative '../../items/sulfuras'
require_relative 'shared_examples'
require_relative 'shared_context'

describe Sulfuras do
  describe '#update_quality' do
    include_context 'item context'

    let(:name) { 'Sulfuras, Hand of Ragnaros' }
    let(:sell_in_change) { 0 }
    let(:expected_quality_change) { 0 }
    let(:quality) { 80 }

    it_behaves_like 'an item'
  end
end
