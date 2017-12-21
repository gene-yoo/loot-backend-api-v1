class Portfolio < ApplicationRecord
  belongs_to :user

  has_many :portfolio_coins
  has_many :coins, through: :portfolio_coins

  def initialCoins=(params)
    coin_count = params.length
    budget = 2000.00

    params.map do |coinInfo|
      coin = Coin.find_by(symbol: coinInfo[:coinSymbol])
      if coin
        coin
      else
        coin = Coin.create(name: coinInfo[:coinName], symbol: coinInfo[:coinSymbol])
      end

      quantity = (budget / coin_count) / coinInfo[:coinPrice]

      PortfolioCoin.create(trans_price: coinInfo[:coinPrice], trans_type: 'buy', quantity: quantity, paper_currency: 'USD', portfolio_id: self.id, coin_id: coin.id)
    end
  end

  def transactions
    self.portfolio_coins.map do |transaction|
      {
        trans_id: transaction.id,
        trans_price: transaction.trans_price,
        trans_type: transaction.trans_type,
        quantity: transaction.quantity,
        paper_currency: transaction.paper_currency,
        coin_symbol: Coin.find_by(id: transaction.coin_id).symbol
      }
    end
  end
end
