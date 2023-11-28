# frozen_string_literal: true

require_relative '../../items/backstage_pass'
require_relative 'shared_examples'
require_relative 'shared_context'

describe BackstagePass do
  describe '#update_quality' do
    include_context 'item context'

    let(:name) { 'Backstage passes to a TAFKAL80ETC concert' }
    let(:quality) { 0 }

    context 'when more than 10 days until concert' do
      let(:sell_in) { 11 }
      let(:expected_quality_change) { 1 }

      it_behaves_like 'an item'
      it_behaves_like 'an item with increasing quality'
    end

    context 'when 10 days or less' do
      let(:sell_in) { 10 }
      let(:expected_quality_change) { 2 }

      it_behaves_like 'an item'
      it_behaves_like 'an item with increasing quality'
    end

    context 'when 5 days or less' do
      let(:sell_in) { 5 }
      let(:expected_quality_change) { 3 }

      it_behaves_like 'an item'
      it_behaves_like 'an item with increasing quality'
    end

    context 'when just after concert' do
      let(:sell_in) { 0 }
      let(:quality) { 42 }
      let(:expected_quality_change) { -42 }

      it_behaves_like 'an item'
      it_behaves_like 'an item with decreasing quality'
    end

    context 'when 1 day after concert' do
      let(:sell_in) { -1 }
      let(:expected_quality_change) { 0 }

      it_behaves_like 'an item'
    end
  end
end
