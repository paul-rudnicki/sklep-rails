class OrderMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.order_confirmation.subject
  #
  def order_confirmation(order)
    @order = order

    mail to: order.address.email, subject: "Dzięjuje za zamówniene"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.order_in_progress.subject
  #
  def order_in_progress(order)
    @order = order

    mail to: order.address.email, subject: "Zamownie w realizacji"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.order_shipped.subject
  #
  def order_shipped(order)
    @order = order

    mail to: order.address.email, subject: "Zamownie wyslane"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.order_cancelled.subject
  #
  def order_cancelled(order)
    @order = order

    mail to: order.address.email, subject: "Zamownie anulowanie"
  end
end
