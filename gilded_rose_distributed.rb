require './gilded_rose'
require './api'

store = GildedRose.new(
  Gilded::API.items.map {|item| Item.new(*item)}
)

day = 0

puts "Any key to update quality, q to quit"
input = gets
while(input.strip != 'q')
  store.update_quality
  day += 1
  puts "********** ITEMS DAY #{day}:"
  puts store.items.map {|item| "NAME: #{item.name} SELL_IN: #{item.sell_in} QUALITY: #{item.quality}"}
  input = gets
end
