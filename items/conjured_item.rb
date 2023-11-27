# frozen_string_literal: true

require_relative 'basic_item'

class ConjuredItem < BasicItem
  private

  def quality_change
    super * 2
  end
end
