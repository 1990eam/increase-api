# frozen_string_literal: true

class FetchClientData
  include Interactor

  before do
    @adapter = IncreaseAdapter.new
  end

  delegate :payment, :client_identification, to: :context

  def call
    client_data = @adapter.get_client(client_identification)

    raise StandardError.new "Client data empty"  if client_data == nil

    client = Client.new

    client.client_identification = client_data["id"]
    client.email = client_data["email"]
    client.first_name = client_data["first_name"]
    client.last_name = client_data["last_name"]
    client.job = client_data["job"]
    client.country = client_data["country"]
    client.address = client_data["address"]
    client.zip_code = client_data["zip_code"]
    client.phone = client_data["phone"]
    client.total_transactions = payment.payment_transactions.count

    if payment.footer.payment_date > Time.now
      client.amount_to_be_paid = payment.header.total_amount_with_discounts
      client.date_to_be_paid = payment.footer.payment_date
    else
      client.amount_paid = payment.header.total_amount_with_discounts
      client.date_paid = payment.footer.payment_date
    end
    payment.client = client
    payment.save
    client.payment = payment
    client.save
    puts "Giving the API a break"
    sleep 4.5
  end
end
