class Admin::ProductTempsController < Admin::AdminController
  before_action :load_order, only: %i(show edit update destroy)

  def index
    @product_temps = ProductTemp.order_by_status.order_by_time
      .page(params[:page])
      .per Settings.product_per_page
  end

  def edit; end

  def update
    if @product_temp.update_attributes(suggest_params)
      flash[:success] = "This status suggest was update successfully"
      redirect_to request.referrer
    else
      flash[:fail] = "Update fail pls try again"
      flash[:error] = t ".error"
    end
  end

  private

  def suggest_params
    pp = params.require(:product_temp).permit :status
    pp[:status] = params[:product_temp][:status].to_i
    return pp
  end

  def load_order
    @product_temp = ProductTemp.find_by id: params[:id] || not_found
  end
end
