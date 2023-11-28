# frozen_string_literal: true

Dir[File.join(File.dirname(__FILE__), 'items/*.rb')].each { |file| require file }

class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      BasicItem.new(item).update_quality
    end
  end
end
