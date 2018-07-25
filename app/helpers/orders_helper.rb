module OrdersHelper
  def get_status_name order
    if order.inprogess_order?
      t "orders.get_status_name.inprogess"
    elsif order.resolved_order?
      t "orders.get_status_name.resolved"
    else
      t "orders.get_status_name.new_order"
    end
  end
end
