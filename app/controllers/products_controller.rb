class ProductsController < ApplicationController
  @hero_title = "Shop"

  def index
    @products = Product.all
    respond_to do |format|
      format.html # renders the index.html.erb template
      format.json { render json: @products } # renders the products as JSON
    end
  end

  def show
    @product = Product.find(params[:id])
    respond_to do |format|
      format.html # renders the show.html.erb template
      format.json { render json: @product } # renders the product as JSON
    end
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :image)
  end
end
