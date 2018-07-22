module ApplicationHelper
  def load_new_product product
    if product.new_product?
      render :partial => "shared/new_product", locals: {product: product} 
    end
  end

  def show_nav_user
    return unless user_signed_in? 
    render "shared/nav_user" 
  end
end
