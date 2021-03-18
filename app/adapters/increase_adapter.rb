# frozen_string_literal: true
require "uri"
require "net/http"

class IncreaseAdapter
  attr_reader :connector

  def initialize
    @connector = Connector::IncreaseTransactions.new
  end

  def write_file
    response = @connector.fetch_file
    if response.code != "200"
      raise StandardError.new "Could not fetch file from API"
    else
      File.write("app/storage/file.txt", response.read_body)
    end
  end

  def read_file
    file = File.open("app/storage/file.txt")
    file_data = file.readlines.map(&:chomp)
  end

  def get_client(client_identification)
    response = @connector.fetch_client(client_identification)

    if response.code == "200"
      JSON.parse(response.body)
    end
  end
end

