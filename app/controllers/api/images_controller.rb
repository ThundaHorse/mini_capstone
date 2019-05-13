class Api::ImagesController < ApplicationController
  def index 

  end 

  def create 
    @image = Image.new(
                      product_id: params[:product_id], 
                      url: params[:image_url]
                      )

    @image.save 
    render 'show.json.jbuilder' 
  end 


  def show 


  end 


  def update 


  end 


  def destroy 


  end 

end
