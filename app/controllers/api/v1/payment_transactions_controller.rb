class Api::V1::PaymentTransactionsController < Api::V1::BaseController
  before_action :set_client

  def index
    @transactions = @client.payment_transactions
  end

  private

  def set_client
    @client = Client.find(params[:client_id])
  end
end
