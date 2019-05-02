require 'http' 
require 'TTY-table'

system "clear"

puts "=" * 60 
puts "Look at all ma stuff" 
puts "=" * 60 

# table = TTY::Table.new ['Product Name', 'Price', 'URL', 'Description'], [['a1', 'a2'], ['b1', 'b2']]
# table.render(:ascii)
# puts table

response = HTTP.get('http://localhost:3000/api/all_products') 
items = response.parse

item_names = []
item_prices = [] 
item_urls = []
item_description = [] 

items.each do |item_hash|
  item_hash[1].each do |key| 
    item_names << key['name']
    item_prices << key['price'] 
    item_urls << key['image_url'] 
    item_description << key['description']
  end 
end 

header = ['Name', 'Price', 'URL', 'Description']
rows   = [
          # [item_names[0], item_prices[0], item_urls[0], item_description[0]], 
          ['b1', 'b2', 'b3', 'b4']
        ]


table = TTY::Table.new header, rows

table.render width: 200, height: 200, resize: true

puts table
