# frozen_string_literal: true

require_relative 'basic_item'

class BackstagePass < BasicItem
  private

  def max_quality
    50
  end

  def check_quality_borders
    [@quality, max_quality].min
  end

  def quality_change
    return -@quality if @sell_in.zero?
    return 3 if @sell_in < 6
    return 2 if @sell_in < 11

    1
  end
end
