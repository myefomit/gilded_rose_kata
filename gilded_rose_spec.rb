# frozen_string_literal: true

require File.join(File.dirname(__FILE__), 'gilded_rose')
Dir[File.join(File.dirname(__FILE__), 'items/*.rb')].each { |file| require file }

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
  end
end
