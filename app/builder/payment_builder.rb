class PaymentBuilder
  def initialize
    @adapter = IncreaseAdapter.new
    write_file
  end

  def write_file
    @adapter.write_file
    @file = File.open("app/adapters/file.txt", "r")
  end

  def detect_lines
    header_line = 0
    transactions_last_line = 0
    discounts_last_line = 0
    footer_line = 0

    current_line = 0
    payment_nr = 1

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

          puts "payment number #{payment_nr}"
          puts "header: #{header_line}"
          puts "footer: #{footer_line}"
          payment_nr += 1

          build_payment(header_line, transactions_last_line, discounts_last_line, footer_line)
      end
      current_line += 1

    end

  end

  def build_payment(header_line, transactions_last_line, discounts_last_line, footer_line)
    file_to_array = File.foreach("app/adapters/file.txt").to_a

    transactions_lines = file_to_array[header_line + 1..transactions_last_line]
    discounts_lines = file_to_array[transactions_last_line + 1..discounts_last_line]
    footer_line = file_to_array[footer_line]
    header_line = file_to_array[header_line]

    BuildPaymentOrganizer.call(header_line: header_line,
                               transactions_lines: transactions_lines,
                               discounts_lines: discounts_lines,
                               footer_line: footer_line)
  end

end
