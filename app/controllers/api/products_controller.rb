class Api::ProductsController < ApplicationController
  def display_all 
    @product = Product.all 

    render 'display_all_view.json.jbuilder'
  end 

  def first_product 
    @product = Product.find(1) 
    render 'display_all_view.json.jbuilder'
  end 

  def second_product 
    @product = Product.find(2) 
    render 'display_all_view.json.jbuilder'
  end 

end
