class Api::V1::AdminController < Api::V1::BaseController
  respond_to :json

  def seed
    @builder = PaymentBuilder.new
    @builder.process_file
    msg = { :seed => "OK" }
      respond_with do |format|
        format.json  { render :json => msg }
      end
  end

  def reset
    Rails.application.load_seed
    msg = { :reset => "OK" }
      respond_with do |format|
        format.json  { render :json => msg }
      end
  end
end
