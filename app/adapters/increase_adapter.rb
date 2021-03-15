# frozen_string_literal: true
require "uri"
require "net/http"

class IncreaseAdapter
  attr_reader :connector

  def initialize
    @connector = Connector::IncreaseTransactions.new
  end

  def get_file
    response = @connector.fetch_file
    File.write("app/adapters/file.txt", response.read_body)
  end

  def read_file
    file = File.open("app/adapters/file.txt")
    file_data = file.readlines.map(&:chomp)
  end
end

