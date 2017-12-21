class Portfolio < ApplicationRecord
  belongs_to :user

  has_many :portfolio_coins
  has_many :coins, through: :portfolio_coins

  def initialCoins=(coin_names)
    coins = coin_names.map do |coin_name|
      name, symbol = coin_name.split(' ')
      symbol = symbol.gsub('(', '').gsub(')', '')
      coin = Coin.find_by(symbol: symbol)
      if coin
        coin
      else
        Coin.create(name: name, symbol: symbol)
      end
    end

  end

  def initialCoins
    self.coins
  end

end
