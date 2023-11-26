# frozen_string_literal: true

require_relative '../../items/basic_item'
require_relative 'shared_examples'
require_relative 'shared_context'

describe BasicItem do
  describe '#update_quality' do
    include_context 'item context'

    let(:name) { 'basic item' }
    let(:expected_quality_change) { -1 }

    it_behaves_like 'an item'
    it_behaves_like 'an item with decreasing quality'

    context 'when sell by date has passed' do
      let(:sell_in) { 0 }
      let(:expected_quality_change) { -2 }

      it_behaves_like 'an item'
      it_behaves_like 'an item with decreasing quality'
    end
  end
end
