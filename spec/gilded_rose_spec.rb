# frozen_string_literal: true

require File.join(File.dirname(__FILE__), '..', 'gilded_rose')
require_relative '../items/item'

describe GildedRose do
  describe '#update_quality' do
    let(:items) do
      [
        Item.new('dagger', 10, 20),
        Item.new('conjured dagger', 10, 20),
        Item.new('Aged Brie', -10, 50),
        Item.new('Sulfuras, Hand of Ragnaros', 0, 80),
        Item.new('Backstage passes to a TAFKAL80ETC concert', 4, 25)
      ]
    end

    let(:expected_items) do
      [
        Item.new('dagger', 9, 19),
        Item.new('conjured dagger', 9, 18),
        Item.new('Aged Brie', -11, 50),
        Item.new('Sulfuras, Hand of Ragnaros', 0, 80),
        Item.new('Backstage passes to a TAFKAL80ETC concert', 3, 28)
      ]
    end
    subject! { described_class.new(items).update_quality }

    let(:actual) { items[index] }
    let(:expected) { expected_items[index] }

    shared_examples 'updates item' do
      it 'updates item' do
        expect(actual.name).to eq(expected.name)
        expect(actual.sell_in).to eq(expected.sell_in)
        expect(actual.quality).to eq(expected.quality)
      end
    end

    context 'when basic item' do
      let(:index) { 0 }

      include_examples 'updates item'
    end

    context 'when conjured item' do
      let(:index) { 1 }

      include_examples 'updates item'
    end

    context 'when aged brie' do
      let(:index) { 2 }

      include_examples 'updates item'
    end

    context 'when sulfuras' do
      let(:index) { 3 }

      include_examples 'updates item'
    end

    context 'when backstage pass' do
      let(:index) { 4 }

      include_examples 'updates item'
    end
  end
end
