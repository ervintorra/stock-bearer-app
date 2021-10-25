class StocksController < ApplicationController
  before_action :set_stock, only: [:update, :destroy]

  def index
    resp = StockServices::GetStocks.call
    render json: resp.json_response
  end

  def create
    resp = StockServices::CreateStock.call(stock_params)
    render json: resp.json_response, status: resp.success? ? :created : :unprocessable_entity
  end

  def update
    resp = StockServices::UpdateStock.call(@stock, stock_params.except(:bearer_id))
    render json: resp.json_response, status: resp.success? ? :created : :unprocessable_entity
  end

  def destroy
    resp = StockServices::SoftDeleteStock.call(@stock)
    render json: resp.json_response, status: resp.success? ? :ok : :unprocessable_entity
  end

  private

    def set_stock
      @stock = Stock.find(params[:id])
    end

    def stock_params
      params.permit(:name, :ticker, :last_price, :bearer_id)
    end
end
