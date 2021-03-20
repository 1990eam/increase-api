# frozen_string_literal: true

class Connector::IncreaseTransactions
  INCREASE_BASE_URL = "https://increase-transactions.herokuapp.com"
  FILE_URL = "/file.txt"
  BEARER_TOKEN = "1234567890qwertyuiopasdfghjklzxcvbnm"

  def fetch_file(retries)
    url = URI("#{INCREASE_BASE_URL}/#{FILE_URL}")

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true
    https.max_retries = 5

    request = Net::HTTP::Get.new(url)
    request["Authorization"] = "Bearer 1234567890qwertyuiopasdfghjklzxcvbnm"
    request["Retry-After"] = 5

    response = https.request(request)

    if response.code != "200" && retries <= 5
      retries += 1
      sleep 5
      puts "Code #{response.code}: Retrying fetch_file. Retry attempt #{retries}"
      response = fetch_file(retries)
    else
      response
    end
  end

  def fetch_client(client_identification, retries)
    url = URI("#{INCREASE_BASE_URL}/clients/#{client_identification}")

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true
    https.max_retries = 5

    request = Net::HTTP::Get.new(url)
    request["Authorization"] = "Bearer 1234567890qwertyuiopasdfghjklzxcvbnm"
    request["Retry-After"] = 5

    response = https.request(request)

    if response.code != "200" && retries <= 5
      retries += 1
      sleep 5
      puts "Code #{response.code}: Retrying fetch_client. Retry attempt #{retries}"
      response = fetch_client(client_identification, retries)
    else
      response
    end
  end

end
