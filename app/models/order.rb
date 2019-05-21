class Order < ApplicationRecord
  belongs_to :user

  has_many :carted_products 
  has_many :products, through: :carted_products 

  # def product_name 
  #   product = Product.find(product_id).name
  # end 

  def carted
    CartedProduct.where(status: "carted") 
  end 

  def subtotal 
    output = 0
    self.carted.each do |carted_item| 
      multiplier = carted_item.quantity 
      output += ((Product.find(carted_item.product_id).price) * multiplier).round(2)
    end 
    output 
  end 

  def tax 
    tax_output = 0
    self.carted.each do |carted_item| 
      tax_output += (Product.find(carted_item.product_id).price * 0.09).round(2)
    end  
    tax_output 
  end 

  def total 
    tax + subtotal 
  end 

  def all_pricing 
    subtotal
    tax
    total 
  end 
end
