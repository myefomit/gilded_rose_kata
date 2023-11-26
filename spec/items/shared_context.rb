# frozen_string_literal: true

shared_context 'item context' do
  let(:sell_in) { 10 }
  let(:quality) { 20 }
  let(:sell_in_change) { -1 }
  let(:min_quality) { 0 }
  let(:max_quality) { 50 }
  let(:item) { described_class.new(name, sell_in, quality) }
  subject! { item.update_quality }
end
