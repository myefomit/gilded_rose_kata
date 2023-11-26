# frozen_string_literal: true

require_relative 'item'

class ConjuredItem < Item
  MIN_QUALITY = 0

  def update_quality
    @quality -= @sell_in.positive? ? 2 : 4
    @quality = [@quality, MIN_QUALITY].max
    @sell_in -= 1
  end
end
