class ProductsController < ApplicationController
  def index
    products = Product.all
    if params[:rarity]
      products = products.where(rarity: params[:rarity])
    end
    render json: products, status: 200
  end
end
