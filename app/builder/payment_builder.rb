class PaymentBuilder
  def initialize
    @adapter = IncreaseAdapter.new
    write_file
  end

  def write_file
    @adapter.write_file
    @file = File.open("app/storage/file.txt", "r")
  end

  def process_file
    header_line = 0
    transactions_last_line = 0
    discounts_last_line = 0
    footer_line = 0

    current_line = 0

    @file.each_line do |line|

      case line[0]
        when "1"
          header_line = current_line
        when "2"
          transactions_last_line = current_line
        when "3"
          discounts_last_line = current_line
        when "4"
          footer_line = current_line

          build_payment_chunk(header_line, transactions_last_line, discounts_last_line, footer_line)
      end
      current_line += 1
    end

  end

  def build_payment_chunk(header_line, transactions_last_line, discounts_last_line, footer_line)
    file_to_array = File.foreach("app/storage/file.txt").to_a

    transactions_lines = file_to_array[header_line + 1..transactions_last_line]
    transactions_lines.each do |line|
      line.gsub!("\n", "")
    end
    discounts_lines = file_to_array[transactions_last_line + 1..discounts_last_line]
    discounts_lines.each do |line|
      line.gsub!("\n", "")
    end
    footer_line = file_to_array[footer_line].gsub("\n", "")
    header_line = file_to_array[header_line].gsub("\n", "")

    BuildPaymentOrganizer.call(header_line: header_line,
                               transactions_lines: transactions_lines,
                               discounts_lines: discounts_lines,
                               footer_line: footer_line)
  end

end
