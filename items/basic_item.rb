# frozen_string_literal: true

class BasicItem
  def initialize(item)
    @item = item
  end

  def update_quality
    @item.quality += quality_increase
    @item.quality = ensure_quality_borders
    @item.sell_in -= 1
  end

  private

  def min_quality
    0
  end

  def max_quality
    50
  end

  def quality_change
    -1
  end

  def ensure_quality_borders
    quality = [@item.quality, min_quality].max
    [quality, max_quality].min
  end

  def quality_increase
    @item.sell_in.positive? ? quality_change : quality_change * 2
  end
end
