# frozen_string_literal: true

require_relative 'basic_item'

class ConjuredItem < BasicItem
  private

  def quality_change
    @sell_in.positive? ? -2 : -4
  end
end
