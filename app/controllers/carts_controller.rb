class CartsController < ApplicationController
  before_action :set_cart, :find_product, only: %i(add_cart remove_product update_quantity)
  before_action :load_product_in_cart, only: %i(index)

  def index; end

  def add_cart
    if session[:cart].key? @product.id.to_s
      session[:cart][@product.id.to_s] += Settings.cart.add_cart
    else
      session[:cart][@product.id.to_s] = Settings.cart.add_cart
    end
    redirect_to carts_path
  end

  def update_quantity
    if session[:cart][@product.id.to_s] > Settings.cart.verify_delete_cart
      session[:cart][@product.id.to_s] -= Settings.cart.add_cart
    else
      session[:cart].delete(@product.id.to_s)
    end
    redirect_to carts_path
  end

  def remove_product
    session[:cart].delete(@product.id.to_s) if session[:cart].key? @product.id.to_s
    redirect_to carts_path
  end

  def remove_cart
    session[:cart] = {}
    redirect_to root_path
  end

  private

  def load_product_in_cart
    if is_empty_cart?
      flash[:danger] = t ".danger"
      redirect_to products_path
    else
      @products_in_cart = Product.load_product session[:cart].keys
    end
  end

  def load_quantity_in_cart
    @products_in_cart.each do |product|
      product.quantity_in_cart = session[:cart][product.id.to_s]
    end
  end

  def find_product
    @product = Product.find_by(id: params[:product_id]) || not_found
  end
end
