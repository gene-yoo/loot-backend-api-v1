class Api::V1::PortfolioCoinsController < ApplicationController
  def create
    portfolio = Portfolio.find_by(id: trans_params[:portfolioId])

    coin = Coin.find_or_create_by(name: trans_params[:coinName], symbol: trans_params[:coinSymbol])

    quantity = trans_params[:transactionAmount] / trans_params[:transactionPrice]

    transaction = PortfolioCoin.new(trans_price: trans_params[:transactionPrice], trans_amt: trans_params[:transactionAmount], trans_type: trans_params[:transactionType], quantity: quantity, paper_currency:'USD', portfolio_id: portfolio.id, coin_id: coin.id)

    if transaction.valid?
      transaction.save

      if transaction.trans_type === 'buy'
        portfolio.balance -= trans_params[:transactionAmount]
      else
        portfolio.balance += trans_params[:transactionAmount]
      end

      portfolio.save
      render json: portfolio
    else
      render json: {error: 'You must be playing yoself ... '}, status: 401
    end
  end

  private

  def trans_params
    params.require(:transaction).permit(:portfolioId, :transactionAmount, :transactionType, :coinName, :coinSymbol, :transactionPrice)
  end
end
