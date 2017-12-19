class User < ApplicationRecord
  has_secure_password validations: false
  has_many :portfolios
  has_many :portfolio_coins, through: :portfolios
  has_many :coins, through: :portfolios

end
