class TransactionsController < ApplicationController
  def destroy
    @portfolio = Portfolio.find(params[:portfolio_id])
    @transaction = Transaction.find(params[:id])
    @transaction.destroy

    redirect_to portfolio_path(@portfolio)
  end
end
