# frozen_string_literal: true

class Connector::IncreaseTransactions
  INCREASE_BASE_URL = "https://increase-transactions.herokuapp.com"
  FILE_URL = "/file.txt"
  BEARER_TOKEN = "1234567890qwertyuiopasdfghjklzxcvbnm"

  def fetch_file
    url = URI("#{INCREASE_BASE_URL}/#{FILE_URL}")

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true
    https.max_retries = 5

    request = Net::HTTP::Get.new(url)
    request["Authorization"] = "Bearer 1234567890qwertyuiopasdfghjklzxcvbnm"

    response = https.request(request)
  end

  def fetch_client(client_identification)
    url = URI("#{INCREASE_BASE_URL}/clients/#{client_identification}")

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true
    https.max_retries = 5

    request = Net::HTTP::Get.new(url)
    request["Authorization"] = "Bearer 1234567890qwertyuiopasdfghjklzxcvbnm"

    response = https.request(request)
  end

end
