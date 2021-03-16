# frozen_string_literal: true

class BuildFooter
  include Interactor

  delegate :header, :payment, :transactions_lines, :discounts_lines, :footer_line, to: :context

  def call
    footer = Footer.new
    footer.payment = payment
    footer.payment_date = footer_line.split("               ").second[0..7]
    footer.client_identification = footer_line.split("               ").second[8..40].gsub("\n", "")
    footer.save
    payment.save
  end
end
