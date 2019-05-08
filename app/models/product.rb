class Product < ApplicationRecord
  def is_discounted?
    price < 45 
    # price < 45 ? true : false  
  end 

  def tax 
    (price * 0.09)
  end 

  def total 
    tax + price 
  end 

  def in_stock
    if quantity > 0 
      "Yes" 
    else 
      "Hell No"
    end 
  end 
end
