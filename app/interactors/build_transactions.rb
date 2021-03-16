# frozen_string_literal: true

class BuildTransactions
  include Interactor

  delegate :transactions_lines, :discounts_lines, :footer_line, :header, to: :context

  def call
    payment = header.payment # pasar por contexto mejor?
    transactions_lines.each do |l|
      transaktion = PaymentTransaction.new
      transaktion.payment = header.payment
      transaktion.transaction_identification = l[0..32]
      transaktion.amount = l[33..45]
      transaktion.status = l.split("     ").second
      transaktion.save
    end
    payment.save
    context.payment = payment
  end
end
