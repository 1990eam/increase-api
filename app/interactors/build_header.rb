# frozen_string_literal: true

class BuildHeader
  include Interactor

  before do
    payment = context.payment
  end

  delegate :header_line, :transactions_lines, :discounts_lines, :footer_line, :payment, to: :context

  def call
    header = Header.new
    header.payment_identification = header_line.split("   ").first
    header.currency = header_line.split("   ").second[0..2]
    header.total_amount = header_line.split("   ").second[3..15]
    header.total_discounts = header_line.split("   ").second[16..28]
    header.total_amount_with_discounts = header_line.split("   ").second[29..42].gsub("\n", "")
    header.payment = payment
    header.save

    context.header = header
  end
end
