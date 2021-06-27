class PortfoliosController < ApplicationController
  def index
    @portfolios = Portfolio.all
  end

  def show
    @portfolio = Portfolio.find(params[:id])
    @stock = Stock.new
    @transaction = Transaction.new
  end

  def new
    @portfolio = Portfolio.new
  end

  def create
    @portfolio = Portfolio.new(portfolio_params)

    if @portfolio.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @portfolio = Portfolio.find(params[:id])
  end

  def update
    @portfolio = Portfolio.find(params[:id])

    if @portfolio.update(portfolio_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @portfolio = Portfolio.find(params[:id])
    @portfolio.destroy

    redirect_to root_path
  end

  def create_stock
    @portfolio = Portfolio.find(params[:portfolio_id])
    @stock = @portfolio.stocks.new(stock_params)
    respond_to do |format|
      @stock.save
      format.js
    end
  end

  def create_transaction
    @stock = Stock.find(params[:stock_id])
    @portfolio = @stock.portfolio
    @transaction = @stock.transactions.new(transaction_params)
    respond_to do |format|
      @transaction.save
      format.js
    end
  end

  private
    def portfolio_params
      params.require(:portfolio).permit(:name)
    end

    def stock_params
      params.require(:stock).permit(:ticker, :name)
    end

    def transaction_params
      params.require(:transaction).permit(:date, :share_amount, :cost_per_share, :multiplier, :transaction_type)
    end
end
