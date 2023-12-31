# frozen_string_literal: true

require_relative 'basic_item'

class BackstagePass < BasicItem
  private

  def quality_increase
    return -@item.quality if @item.sell_in < 1
    return 3 if @item.sell_in < 6
    return 2 if @item.sell_in < 11

    1
  end
end
