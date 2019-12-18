class UserMailer < ApplicationMailer
  default from: "no-reply@example.com"
 

  def send_notification_email(user, order)
    @user = user
    @order = order
    mail(:to => user.email,
          :subject => "Order Confirmed!")
  end
end
