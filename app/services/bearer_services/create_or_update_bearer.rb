module BearerServices
  class CreateOrUpdateBearer < BaseService
    def initialize(bearer_params)
      @bearer_params = bearer_params
    end

    def execute
      bearer = Bearer.find_or_initialize_by(name: @bearer_params[:name])
      bearer.assign_attributes(
      @bearer_params.except(:stock_id, :name))

      stock = Stock.find_by_id(@bearer_params[:stock_id])
      return unsuccess_response(message: ["Stock with id: #{@bearer_params[:stock_id]} does not exists"]) unless stock

      bearer_stock = bearer.stocks.find_by(id: stock.id)
      bearer.stocks.push(stock) unless bearer_stock

      if bearer.save
        success_response(resource: bearer)
      else
        unsuccess_response(message: bearer.errors.full_messages)
      end
    end
  end
end