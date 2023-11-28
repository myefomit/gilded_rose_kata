# frozen_string_literal: true

require File.join(File.dirname(__FILE__), '..', 'gilded_rose')
Dir[File.join(File.dirname(__FILE__), '../items/*.rb')].each { |file| require file }

describe GildedRose do
  describe '#update_quality' do
    items =
      [
        Item.new('dagger', 10, 20),
        Item.new('conjured dagger', 10, 20),
        Item.new('Aged Brie (from cave)', -10, 50),
        Item.new('Sulfuras, Hand of Someone', 0, 80),
        Item.new('Backstage pass', 4, 25)
      ]

    expected_items =
      [
        Item.new('dagger', 9, 19),
        Item.new('conjured dagger', 9, 18),
        Item.new('Aged Brie (from cave)', -11, 50),
        Item.new('Sulfuras, Hand of Someone', 0, 80),
        Item.new('Backstage pass', 3, 28)
      ]
    subject! { described_class.new(items).update_quality }

    items.zip(expected_items).each do |actual, expected|
      it 'doesnt change item name' do
        expect(actual.name).to eq(expected.name)
      end

      it 'updates sell_in correctly' do
        expect(actual.sell_in).to eq(expected.sell_in)
      end

      it 'updates quality correctly' do
        expect(actual.quality).to eq(expected.quality)
      end
    end
  end
end
