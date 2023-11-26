# frozen_string_literal: true

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
