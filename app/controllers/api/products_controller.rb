class Api::ProductsController < ApplicationController
  def display_all 
    @product = Product.all 
  end 
end
