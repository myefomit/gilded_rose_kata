# frozen_string_literal: true

require File.join(File.dirname(__FILE__), 'gilded_rose')

shared_examples 'an item' do
  it 'does not change the name' do
    expect(item.name).to eq name
  end

  it 'changes sell_in' do
    expect(item.sell_in).to eq(sell_in + sell_in_change)
  end

  it 'changes quality' do
    expect(item.quality).to eq(quality + quality_change)
  end
end

describe GildedRose do
  describe '#update_quality' do
    let(:sell_in) { 10 }
    let(:quality) { 20 }
    let(:item) { Item.new(name, sell_in, quality) }
    let(:items) { [item] }
    subject! { described_class.new(items).update_quality }

    describe 'basic item' do
      let(:name) { 'basic item' }
      let(:sell_in_change) { -1 }
      let(:quality_change) { -1 }
      let(:min_quality) { 0 }

      it_behaves_like 'an item'

      context 'when sell by date has passed' do
        let(:sell_in) { 0 }

        it 'decreases quality twice as fast' do
          expect(item.quality).to eq(quality + quality_change * 2)
        end
      end

      context 'when min quality' do
        let(:quality) { min_quality }

        it 'does not decrease quality' do
          expect(item.quality).to eq(min_quality)
        end
      end
    end

    describe 'Aged Brie' do
      let(:name) { 'Aged Brie' }
      let(:sell_in_change) { -1 }
      let(:quality_change) { 1 }
      let(:max_quality) { 50 }

      it_behaves_like 'an item'

      context 'when max quality' do
        let(:quality) { max_quality }

        it 'does not increase quality' do
          expect(item.quality).to eq(max_quality)
        end
      end
    end
  end
end
