# frozen_string_literal: true

Dir[File.join(File.dirname(__FILE__), 'items/*.rb')].each { |file| require file }

class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      item_updater(item).update_quality
    end
  end

  private

  def item_updater(item)
    updaters = {
      'Aged Brie' => AgedBrie,
      'Backstage passes to a TAFKAL80ETC concert' => BackstagePass,
      'Sulfuras, Hand of Ragnaros' => Sulfuras
    }

    updater = updaters[item.name]
    updater ||= conjured?(item.name) ? ConjuredItem : BasicItem
    updater.new(item)
  end

  def conjured?(name)
    name.downcase.start_with? 'conjured'
  end
end
