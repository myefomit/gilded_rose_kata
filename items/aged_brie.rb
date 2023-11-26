# frozen_string_literal: true

require_relative 'item'

class AgedBrie < Item
  MAX_QUALITY = 50

  def update_quality
    @quality -= @sell_in.positive? ? -1 : -2
    @quality = [@quality, MAX_QUALITY].min
    @sell_in -= 1
  end
end
