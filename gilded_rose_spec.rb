require File.join(File.dirname(__FILE__), 'gilded_rose')

describe GildedRose do
  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "foo"
    end

    describe 'quality change' do
      describe 'sulfuras' do
        it 'sulfuras is always 80' do
          items = [Item.new("Sulfuras, Hand of Ragnaros", 1, 80)]
          GildedRose.new(items).update_quality()
          expect(items[0].quality).to eq 80
        end
      end

      describe 'backstage passes' do
        describe 'increases until concert' do
          it 'by 1 before 10 days' do
            items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 11, 1)]
            GildedRose.new(items).update_quality()
            expect(items[0].quality).to eq 2
          end

          it 'by 2 between 10 and 6 days' do
            items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 1)]
            GildedRose.new(items).update_quality()
            expect(items[0].quality).to eq 3
          end

          it 'by 3 from 5 days or less' do
            items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 1)]
            GildedRose.new(items).update_quality()
            expect(items[0].quality).to eq 4
          end

          it 'never goes over 50' do
            items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 1, 50)]
            GildedRose.new(items).update_quality()
            expect(items[0].quality).to eq 50
          end
        end

        it 'drops to 0 after concert' do
          items = [Item.new("Backstage passes to a TAFKAL80ETC concert", -1, 50)]
          GildedRose.new(items).update_quality()
          expect(items[0].quality).to eq 0
        end
      end

      describe 'Aged Brie' do
        it 'always increases with age' do
          items = [Item.new("Aged Brie", 11, 1)]
          GildedRose.new(items).update_quality()
          expect(items[0].quality).to eq 2
        end

        it 'never goes over 50' do
          items = [Item.new("Aged Brie", 11, 50)]
          GildedRose.new(items).update_quality()
          expect(items[0].quality).to eq 50
        end
      end

      describe 'everything else' do
        it 'decreases by 1 before sell by' do
          items = [Item.new("Anything", 1, 1)]
          GildedRose.new(items).update_quality()
          expect(items[0].quality).to eq 0
        end

        it 'decreases by 2 after sell by' do
          items = [Item.new("Anything", 0, 2)]
          GildedRose.new(items).update_quality()
          expect(items[0].quality).to eq 0
        end

        it 'never goes below 0' do
          items = [Item.new("Anything", 0, 0)]
          GildedRose.new(items).update_quality()
          expect(items[0].quality).to eq 0
        end

        describe 'conjured' do
          it 'decreases by 2 before sell by' do
            pending
            items = [Item.new("Conjured Anything", 1, 2)]
            GildedRose.new(items).update_quality()
            expect(items[0].quality).to eq 0
          end

          it 'decreases by 4 after sell by' do
            pending
            items = [Item.new("Conjured Anything", 0, 4)]
            GildedRose.new(items).update_quality()
            expect(items[0].quality).to eq 0
          end

          it 'never goes below 0' do
            items = [Item.new("Conjured Anything", 0, 0)]
            GildedRose.new(items).update_quality()
            expect(items[0].quality).to eq 0
          end
        end
      end
    end
  end
end
