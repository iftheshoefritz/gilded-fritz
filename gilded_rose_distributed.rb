require './gilded_rose'
require './api'

store = GildedRose.new(
  Gilded::API.items.map {|item| Item.new(*item)}
)

puts "********** ITEMS YESTERDAY:"

puts store.items.map {|item| "NAME: #{item.name} SELL_IN: #{item.sell_in} QUALITY: #{item.quality}"}

store.update_quality

puts "********** ITEMS TODAY:"

puts store.items.map {|item| "NAME: #{item.name} SELL_IN: #{item.sell_in} QUALITY: #{item.quality}"}
