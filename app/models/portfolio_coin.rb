class PortfolioCoin < ApplicationRecord
  belongs_to :portfolio
  belongs_to :coin
end
