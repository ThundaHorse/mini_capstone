class Order < ApplicationRecord
  belongs_to :product
  belongs_to :user

  def product_name 
    product = Product.find(product_id).name
  end 

  def subtotal 
    product = Product.find(product_id).price
  end 


  def tax 
    product = Product.find(product_id).price * 0.09
  end 

  def total 
    (tax + subtotal) * quantity
  end 
end
