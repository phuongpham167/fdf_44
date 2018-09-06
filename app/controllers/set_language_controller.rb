class SetLanguageController < ApplicationController
  def english
  	I18n.locale = :en
    set_session_and_redirect
  end

  def vietnam
  	I18n.locale = :vn
    set_session_and_redirect
  end

  private
  def set_session_and_redirect
    session[:locale] = I18n.locale 
    redirect_to request.referrer 
  end
end
