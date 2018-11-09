class UserMailer < ApplicationMailer
  default from: 'notifications@ejungle.com'

  def order_receipt_email(order)
    @order = order
    @line_item = LineItem.find_by(order_id: @order.id)

    mail(to: @order.email, subject: @order.id)
  end

end
