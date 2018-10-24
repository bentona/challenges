class NormalUpdater
  QUALITY_MIN = 0

  def quality_max
    50
  end

  def quality_change
    -1
  end

  def initialize(item)
    @item = item
  end

  def update
    @item.sell_in -= 1
    @item.quality = new_quality_value
  end

  def delta
    value = quality_change
    value += quality_change if @item.sell_in <= 0
    value
  end

  def new_quality_value
    value = [QUALITY_MIN, @item.quality + delta].max
    [value, quality_max].min
  end
end

class BrieUpdater < NormalUpdater
  QUALITY_CHANGE = 1

  def quality_change
    1
  end

end

class SulfurasUpdater < NormalUpdater
  def quality_change
    0
  end

  def quality_max
    80
  end
end

class BackstagePassUpdater < NormalUpdater
  
  def new_quality_value
    return 0 if @item.sell_in <= 0
    return 50 if @item.quality >= 50
    if @item.sell_in >= 10
      @item.quality + 1
    elsif @item.sell_in >= 5
      @item.quality + 2
    else
      @item.quality + 3
    end
  end
end

class ConjuredUpdater < NormalUpdater
  def quality_change
    -2
  end
end


class GildedRose

  def initialize(items)
    @items = items
  end
  
  def update_quality()
    @items.map do |item|
      update_item(item)
    end
  end

  def update_item(item)
    updater = updater(item).new(item).update
  end

  def updater(item)  
    case item.name
    when "Aged Brie"
      return BrieUpdater
    when "Sulfuras, Hand of Ragnaros"
      return SulfurasUpdater
    when "Backstage passes to a TAFKAL80ETC concert"
      return BackstagePassUpdater
    when "Conjured Mana Cake"
      return ConjuredUpdater
    else
      return NormalUpdater
    end
  end

end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end