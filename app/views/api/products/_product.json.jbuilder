json.id product.id 
json.name product.name 
json.price product.price
json.quantity product.quantity 
json.in_stock product.in_stock
json.description product.description
json.tax product.tax
json.price product.price 
json.total product.total


json.formatted do 
  json.price number_to_currency(product.price)
  json.tax number_to_currency(product.tax)
  json.total number_to_currency(product.total)
  json.is_discounted product.is_discounted?
  json.total product.total
end  

json.supplier_id product.supplier_id
json.images product.images
