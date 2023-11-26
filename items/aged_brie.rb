# frozen_string_literal: true

require_relative 'basic_item'

class AgedBrie < BasicItem
  private

  def max_quality
    50
  end

  def check_quality_borders
    [@quality, max_quality].min
  end

  def quality_change
    @sell_in.positive? ? 1 : 2
  end
end
