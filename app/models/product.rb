class Product < ApplicationRecord

  validates :name, presence: true 
  validates :name, uniqueness: true 

  validates :description, presence: true 

  validates :price, presence: true 
  validates :price, numericality: { greater_than_or_equal_to: 0, less_than: 9999999.99 }  

  has_many :images 
  belongs_to :supplier 

  # def images
  #   Image.find_by(product_id: id) 
  # end 

   def supplier 
  #   # Purpose of this method is to return the supplier object associated with this product 
    Supplier.find_by(id: self.supplier_id)

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
