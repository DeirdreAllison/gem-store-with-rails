class ProductsController < ApplicationController
  def index
    products = Product.all
    if params[:rarity]
      products = products.where(rarity: params[:rarity])
    end
    render json: products, status: 200
  end

  def create
    product = Product.new(product_params)
    if product.save
      render json: product, status: 201, location: product
    else
      render json: product.errors, status: 422
    end
  end

  def product_params
    params.require(:product).permit(:name, :rarity)
  end
end
