# frozen_string_literal: true

require File.join(File.dirname(__FILE__), '..', 'gilded_rose')
Dir[File.join(File.dirname(__FILE__), '../items/*.rb')].each { |file| require file }

describe GildedRose do
  describe '#update_quality' do
    let(:items) do
      [
        Item.new('dagger', 10, 20),
        Item.new('conjured dagger', 10, 20),
        Item.new('Aged Brie (from cave)', -10, 50),
        Item.new('Sulfuras, Hand of Someone', 0, 80),
        Item.new('Backstage pass', 4, 25)
      ]
    end

    let(:expected_items) do
      [
        Item.new('dagger', 9, 19),
        Item.new('conjured dagger', 9, 18),
        Item.new('Aged Brie (from cave)', -11, 50),
        Item.new('Sulfuras, Hand of Someone', 0, 80),
        Item.new('Backstage pass', 3, 28)
      ]
    end
    subject! { described_class.new(items).update_quality }

    it 'does not crash' do
      items.zip(expected_items).each do |actual, expected|
        expect(actual.name).to eq(expected.name)
        expect(actual.sell_in).to eq(expected.sell_in)
        expect(actual.quality).to eq(expected.quality)
      end
    end
  end
end
