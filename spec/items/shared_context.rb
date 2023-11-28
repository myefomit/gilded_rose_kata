# frozen_string_literal: true

require_relative '../../items/item'

shared_context 'item context' do
  let(:sell_in) { 10 }
  let(:quality) { 20 }
  let(:sell_in_change) { -1 }
  let(:min_quality) { 0 }
  let(:max_quality) { 50 }
  let(:item) { Item.new(name, sell_in, quality) }
  subject! { described_class.new(item).update_quality }
end
