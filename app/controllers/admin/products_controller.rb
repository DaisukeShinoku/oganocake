class Admin::ProductsController < ApplicationController
  before_action :authenticate_admin!

  def new
    @product = Product.new
  end

  def index
    @products = Product.all
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_product_path(@product.id), success: "登録されました"
    else
      render action: :new, danger: '登録に失敗しました'
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def show
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to admin_product_path(@product.id)
    else
      render :edit
    end
  end

  private

  def product_params
    params.require(:product).permit(:image, :name, :introduction, :genre_id, :price, :validation)
  end
end
