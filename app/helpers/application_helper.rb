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

  def load_rating
    if @product.average("rating").nil?
      Settings.rating.default
    else
      @product.average("rating").avg
      @product.update_avg_point
    end
  end
end
