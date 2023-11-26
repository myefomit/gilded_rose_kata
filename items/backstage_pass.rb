# frozen_string_literal: true

require_relative 'basic_item'

class BackstagePass < BasicItem
  private

  def quality_change
    return -@quality if @sell_in.zero?
    return 3 if @sell_in < 6
    return 2 if @sell_in < 11

    1
  end
end
