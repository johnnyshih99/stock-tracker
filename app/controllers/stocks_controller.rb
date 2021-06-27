class StocksController < ApplicationController
  def destroy
    @portfolio = Portfolio.find(params[:portfolio_id])
    @stock = Stock.find(params[:id])
    @stock.destroy

    redirect_to portfolio_path(@portfolio)
  end
end
