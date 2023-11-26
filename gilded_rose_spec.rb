# frozen_string_literal: true

require File.join(File.dirname(__FILE__), 'gilded_rose')
Dir[File.join(File.dirname(__FILE__), 'items/*.rb')].each { |file| require file }

shared_examples 'an item' do
  it 'does not change the name' do
    expect(item.name).to eq name
  end

  it 'changes sell_in' do
    expect(item.sell_in).to eq(sell_in + sell_in_change)
  end

  it 'changes quality' do
    expect(item.quality).to eq(quality + expected_quality_change)
  end
end

shared_examples 'an item with decreasing quality' do
  context 'when quality + expected_quality_change < min_quality' do
    let(:quality) { min_quality + expected_quality_change.abs - 1 }

    it 'sets item quality to min_quality' do
      expect(item.quality).to eq(min_quality)
    end
  end
end

shared_examples 'an item with increasing quality' do
  context 'when quality + expected_quality_change > max_quality' do
    let(:quality) { max_quality - expected_quality_change + 1 }

    it 'sets item quality to max_quality' do
      expect(item.quality).to eq(max_quality)
    end
  end
end

describe GildedRose do
  describe '#update_quality' do
    let(:sell_in) { 10 }
    let(:quality) { 20 }
    let(:sell_in_change) { -1 }
    let(:min_quality) { 0 }
    let(:max_quality) { 50 }
    let(:item) { item_class.new(name, sell_in, quality) }
    let(:items) { [item] }
    subject! { described_class.new(items).update_quality }

    describe 'Aged Brie' do
      let(:item_class) { AgedBrie }
      let(:name) { 'Aged Brie' }
      let(:expected_quality_change) { 1 }

      it_behaves_like 'an item'
      it_behaves_like 'an item with increasing quality'

      context 'when sell by date has passed' do
        let(:sell_in) { 0 }
        let(:expected_quality_change) { 2 }

        it_behaves_like 'an item'
        it_behaves_like 'an item with increasing quality'
      end
    end

    describe 'Sulfuras, Hand of Ragnaros' do
      let(:item_class) { Sulfuras }
      let(:name) { 'Sulfuras, Hand of Ragnaros' }
      let(:sell_in_change) { 0 }
      let(:expected_quality_change) { 0 }
      let(:quality) { 80 }

      it_behaves_like 'an item'
    end

    describe 'Backstage passes to a TAFKAL80ETC concert' do
      let(:item_class) { BackstagePass }
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

      context 'when after concert' do
        let(:sell_in) { 0 }
        let(:quality) { 42 }
        let(:expected_quality_change) { -42 }

        it_behaves_like 'an item'
        it_behaves_like 'an item with decreasing quality'
      end
    end
  end
end
