module StockServices
  class CreateStock < BaseService
    def initialize(stock_params)
      @stock_params = stock_params
    end

    def execute
      stock = Stock.new(@stock_params.except(:bearer_id))
      return unsuccess_response(message: "Bearer with id: #{@stock_params[:bearer_id]} does not exists.") unless bearer

      stock.bearers << bearer
      if stock.save
        success_response(resource: stock.attributes.except('enabled'))
      else
        unsuccess_response(message: stock.errors.full_messages)
      end
    end

    private

    def bearer
      @bearer ||= Bearer.find_by(id: @stock_params[:bearer_id])
    end
  end
end