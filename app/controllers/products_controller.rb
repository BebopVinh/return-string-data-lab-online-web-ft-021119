class ProductsController < ApplicationController
  before_action :set_product, only: [:inventory, :description]

  def index
    @products = Product.all
  end

  def new
  end

  def create
    #  binding.pry
    product = Product.new(product_params)
    if product.valid?
      product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def inventory
    if @product.inventory > 0
      render plain: "true"
    else
      render plain: "false"
    end
  end

  def description
    render plain: @product.description if @product.description
  end

  private

  def product_params
    params.require(:product).permit(:description, :inventory, :name, :price)
  end

  def set_product
    @product = Product.find_by(id: params[:id])
  end
end
