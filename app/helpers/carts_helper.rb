module CartsHelper
  def set_cart
    @cart = session[:cart] ||= {}
  end

  def is_empty_cart?
    session[:cart].blank?
  end

  def sub_product_price product
    session[:cart][product.id.to_s] * product.price
  end

  def sum_total_price
    @products_in_cart.collect{|product| session[:cart][product.id.to_s] * product.price}.sum
  end
end
