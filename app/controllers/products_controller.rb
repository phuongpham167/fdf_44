class ProductsController < ApplicationController
  def index
    @products = Product.includes(:images)
      .order_by_name
      .page(params[:page])
      .per Settings.product_per_page
    @products_new = Product.includes(:images)
      .order_by_time
      .limit Settings.product_per_page
  end

  def show
    @product = Product.includes(:images).find_by(id: params[:id]) || not_found
  end
end
