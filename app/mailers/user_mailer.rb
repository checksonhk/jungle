class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def order_confirmation(user, order)
    @user = user
    @order = order
    @url = "/"
    mail(to: user.email, subject: 'Order has been received')
  end
end
