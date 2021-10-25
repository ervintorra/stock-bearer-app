class BearersController < ApplicationController

  def create_or_update
    resp = BearerServices::CreateOrUpdateBearer.call(bearer_params)
    render json: resp.json_response, status: resp.success? ? :created : :unprocessable_entity
  end

  private

    def bearer_params
      params.permit(:name, :email, :age, :stock_id)
    end
end
