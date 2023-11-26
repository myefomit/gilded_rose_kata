# frozen_string_literal: true

require_relative '../../items/conjured_item'
require_relative 'shared_examples'
require_relative 'shared_context'

describe ConjuredItem do
  describe '#update_quality' do
    include_context 'item context'

    let(:name) { 'Conjured' }
    let(:expected_quality_change) { -2 }

    it_behaves_like 'an item'
    it_behaves_like 'an item with decreasing quality'

    context 'when sell by date has passed' do
      let(:sell_in) { 0 }
      let(:expected_quality_change) { -4 }

      it_behaves_like 'an item'
      it_behaves_like 'an item with decreasing quality'
    end
  end
end
