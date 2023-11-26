# frozen_string_literal: true

require_relative 'item'

class BackstagePass < Item
  MAX_QUALITY = 50

  def update_quality
    @quality += quality_change
    @quality = [@quality, MAX_QUALITY].min
    @sell_in -= 1
  end

  private

  def quality_change
    return -@quality if @sell_in.zero?
    return 3 if @sell_in < 6
    return 2 if @sell_in < 11

    1
  end
end
