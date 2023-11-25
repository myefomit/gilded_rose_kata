# frozen_string_literal: true

require File.join(File.dirname(__FILE__), 'gilded_rose')

describe GildedRose do
  describe '#update_quality' do
    let(:sell_in_decrease) { 1 }
    let(:items) { [item] }
    subject! { described_class.new(items).update_quality }

    describe 'basic item' do
      let(:quality_decrease) { 1 }
      let(:min_quality) { 0 }

      let(:name) { 'basic item' }
      let(:sell_in) { 10 }
      let(:quality) { 20 }
      let(:item) { Item.new(name, sell_in, quality) }

      it 'does not change the name' do
        expect(items.first.name).to eq name
      end

      it 'decreases item sell_in' do
        expect(items.first.sell_in).to eq(sell_in - sell_in_decrease)
      end

      it 'decreases item quality' do
        expect(items.first.quality).to eq(quality - quality_decrease)
      end

      context 'when sell by date has passed' do
        let(:sell_in) { 0 }

        it 'decreases quality twice as fast' do
          expect(items.first.quality).to eq(quality - quality_decrease * 2)
        end
      end

      context 'when quality is the minimal value' do
        let(:quality) { min_quality }

        it 'does not set quality to lower value' do
          expect(items.first.quality).to eq(min_quality)
        end
      end
    end
  end
end
