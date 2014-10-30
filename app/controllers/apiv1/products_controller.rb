module Apiv1
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

    def destroy
      product = Product.find(params[:id])
      product.destroy!
      render nothing: true, status: 204
    end

    def product_params
      params.require(:product).permit(:name, :description, :shine, :price, :rarity,
               :color, :faces, :images)
    end
  end
end
