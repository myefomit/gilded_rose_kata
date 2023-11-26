# frozen_string_literal: true

require_relative 'item'

class BasicItem < Item
  def update_quality
    @quality += quality_increase
    @quality = [@quality, min_quality].max
    @quality = [@quality, max_quality].min
    @sell_in -= 1
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

  def quality_increase
    @sell_in.positive? ? quality_change : quality_change * 2
  end
end
