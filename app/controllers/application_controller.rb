class ApplicationController < ActionController::Base
  include CartsHelper
  before_action :set_locale

  protect_from_forgery with: :exception

  def not_found
    raise ActiveRecord::RecordNotFound, t(:not_found)
  rescue StandardError
    render file: "#{Rails.root}/public/404", status: :not_found
  end

  private
  def set_locale
    I18n.locale = session[:locale] || I18n.default_locale
    session[:locale] = I18n.locale
  end
end
