# frozen_string_literal: true

require_relative 'basic_item'

class AgedBrie < BasicItem
  private

  def quality_delta
    1
  end
end
