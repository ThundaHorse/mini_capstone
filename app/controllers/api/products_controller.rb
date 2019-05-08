class Api::ProductsController < ApplicationController
  def index 
    @product = Product.all 
    render 'display_all_view.json.jbuilder'
  end 

  def create 
    @product = Product.new(
                            name: params[:name],
                            price: params[:price],
                            description: params[:description],
                            image_url: params[:image_url],
                            in_stock: params[:in_stock],
                            quantity: params[:quantity]
                          )

    @product.save 
    render 'show.json.jbuilder'
  end 

  def show 
    @product = Product.find(params[:id])
    render 'show.json.jbuilder'
  end 

  def update 
    @product = Product.find(params[:id])

    @product.id = params[:id] || @product.id
    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    @product.quantity = params[:quantity] || @product.quantity 
    @product.in_stock = params[:in_stock] || @product.in_stock
    @product.description = params[:description] || @product.description
    @product.image_url = params[:image_url] || @product.image_url

    @product.save 
    render 'show.json.jbuilder'
  end 

  def destroy 
    @product = Product.find(params[:id])
    @product.destroy

    render json: {message: "Successfully obliterated"} 
  end 
  
end
