require 'sinatra'

set :bind, '0.0.0.0'

items = [
  ["Sulfuras, Hand of Ragnaros", 1, 90],
  ["Backstage passes to a TAFKAL80ETC concert", 11, 1],
  ["Aged Brie", 11, 1],
]

get '/items' do
  items.to_json
end

get '/items/:id' do |id|
  out_items = items[params['id'].to_i].dup
  out_items[2] -= 10
  out_items.to_json
end
