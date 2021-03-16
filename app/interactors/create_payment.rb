# frozen_string_literal: true

class CreatePayment
  include Interactor

  delegate :header_line, :transactions_lines, :discounts_lines, :footer_line, to: :context

  def call
    payment = Payment.new
    payment.save

    context.payment = payment
  end

end
