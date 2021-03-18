# frozen_string_literal: true

class BuildFooter
  include Interactor

  delegate :payment, :footer_line, to: :context

  def call
    footer = Footer.new
    footer.payment = payment
    footer.payment_date = footer_line.split("               ").second[0..7].to_date
    footer.client_identification = footer_line.split("               ").second[8..40].gsub("\n", "")
    footer.save
    payment.save

    context.payment = payment
    context.client_identification = payment.footer.client_identification
  end
end
