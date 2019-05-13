class Supplier < ApplicationRecord
  has_many :products 
# Purpose is to return a collection of all products associated with this Supplier
  # def products 
  #   # Product.find_by(supplier_id: id) <- one 
  #   Product.where(supplier_id: id)

  # end 
end
