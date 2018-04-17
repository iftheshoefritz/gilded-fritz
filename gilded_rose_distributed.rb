require './gilded_rose'
require './api'

store = GildedRose.new(
  Gilded::API.items.map {|item| Item.new(*item)}
)

day = 0

puts "press i for current inventory, n to advance day"
puts ""
print "> "
input = gets
while(true)
  if input.strip == 'i'
    puts ""
    puts "*** ITEMS DAY #{day} ***"
    puts store.items.map {|item| "NAME: #{item.name} SELL_IN: #{item.sell_in} QUALITY: #{item.quality}"}
    puts ""
  elsif input.strip == 'n'
    day += 1
    store.update_quality
    puts ""
    puts "Advanced day to #{day}"
    puts ""
  end
  puts ""
  puts "press i for current inventory, n to advance day"
  puts ""
  print "> "
  input = gets
end
