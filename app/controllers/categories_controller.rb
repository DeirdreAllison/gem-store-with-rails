class CategoriesController < ApplicationController
  def index
    products = Product.category
    render json: products, status: 200
  end
end
