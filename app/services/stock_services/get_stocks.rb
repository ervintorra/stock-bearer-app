module StockServices
  class GetStocks < BaseService
    def initialize; end

    def execute
      response = []
      bearer_stocks = BearerStock.includes(:bearer, :stock).where(stocks: { enabled: true })
      bearer_stocks.each do |bearer_stock|
        stock = bearer_stock.stock
        bearer = bearer_stock.bearer
        response.push(
          {
            id: stock.id,
            name: stock.name,
            ticker: stock.ticker,
            last_price: stock.last_price,
            bearer: {
              name: bearer.name,
              email: bearer.email,
              age: bearer.age
            }
          }
        )
      end
      success_response(resource: response)
    end
  end
end