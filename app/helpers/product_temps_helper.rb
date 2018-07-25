module ProductTempsHelper
  def get_status_productname product_temp
    if product_temp.approve?
      "Approve"
    else
      "Waitting"
    end
  end
end
