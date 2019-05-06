require 'http' 

request = HTTP.post('http:localhost:3000/products')

new_product = Product.new(
                          name: name_input, 

                         )

puts "Please enter a product name" 
name_input = gets.chomp 

