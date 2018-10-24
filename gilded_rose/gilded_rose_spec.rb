require File.join(File.dirname(__FILE__), 'gilded_rose')

describe GildedRose do

  describe "#update_quality" do

    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq("foo")
    end

    it "decreases the quality of normal items" do
      items = [Item.new("Poo", 10, 20)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to equal(19)
    end


    it "decreases the sell_in of normal items" do
      items = [Item.new("Poo", 10, 20)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to equal(9)
    end

    it "doesn't make quality negative" do
      items = [Item.new("Poo", 5, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to equal(0)
    end

    it "degrades quality twice as fast when sell_in has expired" do
      items = [Item.new("Poo", 0, 3)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to equal(1)
    end

    it "increases the quality of brie" do
      items = [Item.new("Aged Brie", 2, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to equal(1)
    end

    it "increases the quality of brie 2x post-expire" do
      items = [Item.new("Aged Brie", -1, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to equal(2)
    end

    it "does not increase the quality of brie past 50" do
      items = [Item.new("Aged Brie", -1, 50)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to equal(50)
    end

    it "does not change the quality of Sulfuras" do
      items = [Item.new("Sulfuras, Hand of Ragnaros", 10, 80)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to equal(80)
    end

    it "does not change the quality of Sulfuras even past expiry" do
      items = [Item.new("Sulfuras, Hand of Ragnaros", -1, 80)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to equal(80)
    end

    it "increase backstage pass quality by 1 with > 10 days left" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 11, 5)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to equal(6)
    end

    it "increase backstage pass quality by 2 with <= 10 days left" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 5)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to equal(7)
    end

    it "increase backstage pass quality by 3 with <= 5 days left" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 5)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to equal(8)
    end

    it "reduces backstage pass quality to 0 past expiration" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 5)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to equal(0)
    end

    it "does not increase backstage pass quality past 50" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 4, 50)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to equal(50)
    end

  end

end
