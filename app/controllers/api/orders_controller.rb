class Api::OrdersController < ApplicationController
  def index 
    # if current_user
      @order = Order.order('updated_at DESC')

      render 'index.json.jbuilder'
    # else 
    #   render json:{}
    # end 
  end 

  def create 
    if current_user 
      @order = Order.new(
                          user_id: current_user.id,
                          product_id: params[:product_id],
                          quantity: params[:quantity]
                        )

      if @order.save 
        render 'show.json.jbuilder'
      end 
      
    else 
      render json: {message: @order.errors.full_messages }, status: :unprocessable_entity 
    end 

  end 
end
