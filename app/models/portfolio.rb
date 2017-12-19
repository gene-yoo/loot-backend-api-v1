class Portfolio < ApplicationRecord
  belongs_to :user

  has_many :portfolio_coins
  has_many :coins, through: :portfolio_coins
end
