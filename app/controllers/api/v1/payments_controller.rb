class Api::V1::PaymentsController < Api::V1::BaseController
  def index
    @payments = Payment.all
  end
end
