module StockServices
  class SoftDeleteStock < BaseService
    def initialize(stock)
      @stock = stock
    end

    def execute
      @stock.enabled = false
      if @stock.save

        success_response
      else
        unsuccess_response(message: @stock.errors.full_messages)
      end
    end
  end
end