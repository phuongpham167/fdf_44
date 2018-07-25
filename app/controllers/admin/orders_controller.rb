class Admin::OrdersController < Admin::AdminController
  before_action :load_order, only: %i(show edit update destroy)

  def index
    @orders = Order.order_by_status.order_by_time.page(params[:page]).per Settings.product_per_page
  end

  def edit; end

  def update
    if @order.update_attributes(order_params)
      redirect_to request.referrer
    else
      render :edit
    end
  end

  private

  def order_params
    pp = params.require(:order).permit :status
    pp[:status] = params[:order][:status].to_i
    return pp
  end

  def load_order
    @order = Order.find_by id: params[:id] || not_found
  end
end
