class Member::ProductsController < ApplicationController
  def index
    @products = Product.joins(:genre).where(genres: { is_valid: true })
    @quantity = Product.count
    @genres = Genre.where(is_valid: true)
  end

  def show
    @product = Product.find(params[:id])
    @cart_product = CartProduct.new
    @genres = Genre.where(is_valid: true)
  end
end
