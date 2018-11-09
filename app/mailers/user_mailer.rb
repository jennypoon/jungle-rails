class UserMailer < ApplicationMailer
  default from: 'notifications@ejungle.com'

  def order_receipt_email(order)
    @order = order
    mail(to: @order_email, subject: @order_id)
  end

end
