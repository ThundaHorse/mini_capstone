class Api::ProductsController < ApplicationController
  def index 
    sort_attribute = params[:sort]
    sort_order = params[:sort_order]
    search_term = params[:search] 
    discounted = params[:discount] 
    
    @product = Product.all 
 
    
    if search_term 
      @product = @product.where("name iLIKE ? ", "%#{search_term}%")
    end 

    if discounted == 'true'
      @product = @product.where("price < ?", 1000)
    end   

    if sort_attribute && sort_order
      @product = @product.order(sort_attribute => sort_order) 
    elsif sort_attribute == "price" 
      @products = @products.order(:price) 
    else 
      @product = @product.order(:id)
    end 

    render 'display_all_view.json.jbuilder'
  end 

  def create 
    @product = Product.new(
                            name: params[:name],
                            price: params[:price],
                            description: params[:description],
                            image_url: params[:image_url],
                            in_stock: params[:in_stock],
                            quantity: params[:quantity], 
                          )

    if @product.save 
      render 'show.json.jbuilder'
    else 
      render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
    end 
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

    if @product.save 
      render 'show.json.jbuilder'
    else 
      render json: { messages: @product.errors.full_messages }, status: :unprocessable_entity
    end
  end 

  def destroy 
    @product = Product.find(params[:id])
    @product.destroy

    render json: {message: "Successfully obliterated"} 
  end 
  
end


