class Api::CartedProductsController < ApplicationController
  before_action :authenticate_user

  def index 
    @carted_products = current_user.cart 
    
    render 'index.json.jbuilder' 
  end 

  def create 
    @carted_product = CartedProduct.new(
                                        user_id: current_user.id,
                                        product_id: params[:product_id],
                                        quantity: params[:quantity],
                                        status: "carted" 
                                        )
    if @carted_product.save 
      render 'show.json.jbuilder'
    else 
      render json: {message: "Houston we've got a problem" }
    end 
  end 

  def destroy 
    @carted_product = CartedProduct.find(params[:id]) 
    @carted_product.update(status: "removed")
    # @carted_product.delete
    render json: {message: "Successfully removed from cart"} 
  end 

end
