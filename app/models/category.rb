class Category < ApplicationRecord
  has_many :product_categories
  has_many :products, through: :product_categories

  # def products 
  #   # calling belongs to method from product_category.rb 
  #   product_categories.map { |product_category| produt_category.product } 
  # end 
end
