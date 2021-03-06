class Api::V1::ClientsController < Api::V1::BaseController
  def index
    @clients = Client.all
  end

  def show
    @client = Client.find(params[:id])
    @transactions = @client.payment_transactions
  end
end
