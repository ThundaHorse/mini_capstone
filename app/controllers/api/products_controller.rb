class Api::ProductsController < ApplicationController
  def display_all 
    @product = Product.all 

    render 'display_all_view.json.jbuilder'
  end 
end
