class StaticPagesController < ApplicationController
  def home
    if user_signed_in?
      redirect_to products_path
    else
      render "shared/_form_login"
    end
  end

  def contact; end
end
