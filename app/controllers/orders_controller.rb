class OrdersController < ApplicationController
  def index
    @orders = Order.load_order(current_user).order_by_status.order_by_time
      .page(params[:page]).per Settings.product_per_page
  end

  def new
    if !current_user.nil?
      if session[:cart].empty?
        flash[:danger] = t ".danger"
        redirect_to root_path
      else
        @order = Order.new
        @products_in_cart = Product.load_product session[:cart].keys
      end
    else
      flash[:danger] = "Pls Login"
      redirect_to root_path
    end
  end

  def create
    @order = Order.new order_params
    insert_data
    UserNotifierMailer.send_order_email(current_user).deliver
    session[:cart] = nil
    flash[:success] = t ".success"
    redirect_to orders_path
  end

  def show
    @order = Order.find_by id: params[:id]
    @order_details = OrderDetail.load_order_details @order.id
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
