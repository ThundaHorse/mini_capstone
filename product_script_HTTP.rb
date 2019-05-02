require 'http' 

system "clear"

puts "=" * 60 
puts "Look at all ma stuff" 
puts "=" * 60 

response = HTTP.get('http://localhost:3000/api/all_products') 
items = response.parse["product"]

items.each do |item_hash|
  p item_hash['name']
end 
