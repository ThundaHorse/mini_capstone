class Product < ApplicationRecord
  has_many :suppliers

  validates :name, presence: true 
  validates :name, uniqueness: true 

  validates :image_url, length: { maximum: 255 }

  validates :description, presence: true 
  validates :description, length: { in: 50..200 }

  validates :price, presence: true 
  validates :price, numericality: { greater_than_or_equal_to: 0, less_than: 9999999.99 }  

  def suppliers 
    Supplier.where(product_id:self.id) 
  end 

  def is_discounted?
    price < 1000
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
