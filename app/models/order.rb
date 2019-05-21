class Order < ApplicationRecord
  belongs_to :user
  has_many :carted_products 
  has_many :products, through: :carted_products 

  # App record already has initialize 
  def initialize(input_options)
    # use super to pass up specific initialize 
    super
    # call save totals right when instance is instantiated 
    save_totals
  end 

  def calculate_subtotal 
    subtotal_sum = 0 
    user.each do |carted_product| 
      subtotal_sum += carted_product.subtotal 
    end 
    self.subtotal = subtotal_sum
  end 

  def calculate_tax 
    self.tax = subtotal * 0.09 
  end 

  def calculate_total 
    self.total = subtotal + tax 
  end 

  def save_totals
    calculate_subtotal
    calculate_tax
    calculate_total 
    save 
    update_cart 
  end 

  def update_cart 
    user.cart.update_all(status: "purchased", order_id: self.id) 
  end 

end
