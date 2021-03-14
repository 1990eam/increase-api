# frozen_string_literal: true

class IncreaseAdapter
  attr_reader :connector

  def initialize
    @connector = Connector::IncreaseTransactions.new
  end

  def get_file
    connector.fetch_file
  end
end
