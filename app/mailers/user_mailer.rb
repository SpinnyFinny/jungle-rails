class UserMailer < ApplicationMailer
  def order_email(order)
    # @user = user
    byebug
    mail(to: order.email, subject: order.id)
  end
end
