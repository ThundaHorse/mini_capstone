class Api::OrdersController < ApplicationController
  before_action :authenticate_user

  def index 
    @order = current_user.orders

    render 'index.json.jbuilder'
  end 

  def create 
    carted_products = current_user.cart 
    calculated_subtotal = 0 

    carted_products.each do |carted_product| 
      calculated_subtotal += carted_product.subtotal 
    end 

    calculated_tax = calculated_subtotal * 0.09 
    calculated_total = calculated_subtotal + calculated_tax

    @order = Order.new(
                        user_id: current_user.id,
                        subtotal: calculated_subtotal,
                        tax: calculated_tax, 
                        total: calculated_total
                      ) 
    @order.save 

      carted_products.each do |carted_product| 
        carted_product.update(status: "purchased", order_id: @order_id) 
      end 

      render 'show.json.jbuilder'
  end 

  def show 
    @order = Order.find(params[:id])
    render 'show.json.jbuilder'
  end 

  def destroy 
    @order = Order.find(params[:id])
    @order.destroy 

    render json: {message: "Deleted"}
  end 
end
