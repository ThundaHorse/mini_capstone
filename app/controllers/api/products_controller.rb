class Api::ProductsController < ApplicationController
  before_action :authenticate_admin, only: [:create, :update, :destroy] 
  
  def index 
    sort_attribute = params[:sort]
    sort_order = params[:sort_order]
    search_term = params[:search] 
    discounted = params[:discount] 
    category_name = params[:category] 
    
    @products = Product.all 

    if category_name 
      category = Category.find_by(name: category_name) 
      @products = category.products
    end  
 
    
    if search_term 
      @products = @products.where("name iLIKE ? ", "%#{search_term}%")
    end 

    if discounted == 'true'
      @products = @products.where("price < ?", 1000)
    end   

    if sort_attribute && sort_order
      @products = @products.order(sort_attribute => sort_order) 
    elsif sort_attribute == "price" 
      @productss = @productss.order(:price) 
    else 
      @products = @products.order(:id)
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
                            supplier_id: params[:supplier_id]
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


