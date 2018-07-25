class ProductsController < ApplicationController
  before_action :load_product, only: :show
  before_action :set_ransack_search_object

  def index
    @filter = Product.joins(:category).ransack params[:q]
    @filter.build_sort if @filter.sorts.empty?
    @products = @q.result.includes(:category)
      .page(params[:page])
      .per Settings.product_per_page
    @categories = Category.all.order_by_name
  end

  def show; end

  def search
    index
    render :index
  end

  private

  def load_product
    @product = Product.includes(:images).find_by(id: params[:id]) || not_found
  end

  def set_ransack_search_object
    @q = Product.ransack params[:q]
  end
end
