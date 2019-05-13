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

    render 'index.json.jbuilder'
  end 

  def create 
    @product = Product.new(
                            name: params[:name],
                            price: params[:price],
                            description: params[:description],
                            in_stock: params[:in_stock],
                            quantity: params[:quantity], 
                          )

    if @product.save 
      image = Image.new(
                      product_id: @product_id,
                      url: params[:image_url]
                      )
      image.save 

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


