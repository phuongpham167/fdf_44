class OrdersController < ApplicationController
  before_action :order_params, only: %i(create)

  def index
    @orders = Order.load_order(current_user.id)
  end

  def new
    if session[:cart].empty?
      flash[:danger] = "Please choose products"
      redirect_to root_path
    else
      @order = Order.new
      @products_in_cart = Product.load_product session[:cart].keys
    end
  end

  def create
    @order = Order.new order_params
    insert_data
    session[:cart] = nil
    flash[:success] = "Order success"
    redirect_to root_path
  end

  private

  def order_params
    params.require(:order).permit :user_id, :phone, :address
  end

  def insert_data
    ActiveRecord::Base.transaction do
      @order.save
      @products_in_cart = Product.load_product session[:cart].keys
      @products_in_cart.each do |product|
        @order_detail = OrderDetail.create order_id: @order.id,
          product_id: product.id, quantity: session[:cart][product.id.to_s], price: (), price: sub_product_price(product)
        @order_detail.save
      end
    end
    return unless @order.persisted?
  end
end
