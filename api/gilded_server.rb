require 'sinatra'

items = [
  ["Sulfuras, Hand of Ragnaros", 1, 90],
  ["Backstage passes to a TAFKAL80ETC concert", 11, 1],
  ["Aged Brie", 11, 1],
]

get '/items' do
  items.to_json
end

get '/items/:id' do |id|
  items[params['id'].to_i].to_json
end
