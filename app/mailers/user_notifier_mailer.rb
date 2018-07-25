class UserNotifierMailer < ApplicationMailer
  default :from => 'phucnguyen18041997@gmail.com'

  def send_order_email(user)
    @user = user
    mail( :to => @user.email,
    :subject => 'Thanks for signing up for our amazing app' )
  end   
end
