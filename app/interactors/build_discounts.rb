# frozen_string_literal: true

class BuildDiscounts
  include Interactor

  delegate :header, :payment, :transactions_lines, :discounts_lines, :footer_line, to: :context

  def call
    discounts_lines.each do |l|
      discount = Discount.new
      discount.payment = payment
      discount.discount_identification = l[0..32]
      discount.amount = l[33..45]
      discount.discount_type = l.split("   ").second

      discount.save
    end
    payment.save
    context.payment = payment
  end
end
