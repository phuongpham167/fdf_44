class Admin::AdminController < ApplicationController
  layout "admin"
  before_action :verify_admin

  def verify_admin
    return if current_user.admin?
    flash[:danger] = t "admin.danger"
    redirect_to root_path
  end
end
