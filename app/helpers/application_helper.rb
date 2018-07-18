module ApplicationHelper
  def load_new_product product
    if product.new_product?
      render :partial => "shared/new_product", :locals => { :product => product } 
    end
  end
end
