class ProductTempsController < ApplicationController
  def index
    @product_temps = ProductTemp.load_product_temps(current_user).order_by_status.order_by_time.page(params[:page]).per Settings.product_per_page
  end

  def new
    @product_temp = ProductTemp.new
  end

  def create
    @product_temp = current_user.product_temps.build(suggest_params)
    if @product_temp.save
      flash[:success] = t ".success"
      redirect_to product_temps_path
    else
      flash[:danger] = t ".danger"
    end
  end

  private

  def suggest_params
    params.require(:product_temp).permit :name, :price, :descriptions
  end
end
