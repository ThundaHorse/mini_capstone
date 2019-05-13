json.id product.id 
json.name product.name 
json.price product.price
json.quantity product.quantity 
json.in_stock product.in_stock
json.description product.description
json.tax product.tax
json.price product.price 
json.total product.total
json.supplier_id product.supplier_id

json.formatted do 
  json.price number_to_currency(product.price)
  json.tax number_to_currency(product.tax)
  json.total number_to_currency(product.total)
  json.is_discounted product.is_discounted?
  json.total product.total
end  


json.suppliers do 
  json.partial! product.supplier, partial: "api/suppliers/supplier", as: :supplier

end 


# json.images product.images

json.images do 
  json.array! product.images, partial: "api/images/image", as: :image

end 
