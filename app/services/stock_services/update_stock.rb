module StockServices
  class UpdateStock < BaseService
    def initialize(stock, stock_params)
      @stock = stock
      @stock_params = stock_params
    end

    def execute
      if @stock.update(@stock_params)
        success_response(resource: @stock.attributes.except("enabled"))
      else
        unsuccess_response(message: @stock.errors.full_messages)
      end
    end
  end
end