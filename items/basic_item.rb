# frozen_string_literal: true

require_relative 'item'

class BasicItem < Item
  def update_quality
    @quality += quality_change
    @quality = check_quality_borders
    @sell_in -= 1
  end

  private

  def min_quality
    0
  end

  def check_quality_borders
    [@quality, min_quality].max
  end

  def quality_change
    @sell_in.positive? ? -1 : -2
  end
end
