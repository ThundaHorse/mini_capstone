class Api::ProductsController < ApplicationController
  def index 
    @product = Product.all 
    render 'display_all_view.json.jbuilder'
  end 

  def show 
    @product = Product.find(params[:id])
    render 'show.json.jbuilder'
  end 

end
