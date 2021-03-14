# frozen_string_literal: true

class Connector::IncreaseTransactions
  INCREASE_BASE_URL = "https://increase-transactions.herokuapp.com/"
  BEARER_TOKEN = "1234567890qwertyuiopasdfghjklzxcvbnm"

  def connector(url = "#{INCREASE_BASE_URL}")
    Faraday.new(url: url) do |faraday|
      faraday.authorization :Bearer, "#{BEARER_TOKEN}"
      faraday.headers['Authorization']
      faraday.response :json
      faraday.adapter Faraday.default_adapter # make requests with Net::HTTP
    end
  end

  def fetch_file
      connector.get do |req|
        req.url "/file.txt"
      end
  end

end
