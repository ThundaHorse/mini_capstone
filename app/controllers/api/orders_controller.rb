class Api::OrdersController < ApplicationController
  before_action :authenticate_user

  def index 
    @order = current_user.orders

    render 'index.json.jbuilder'
  end 

  def create 
    @order = Order.new(user_id: current_user.id) 

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

