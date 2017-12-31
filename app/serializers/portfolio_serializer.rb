class PortfolioSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :balance, :transactions, :net_holdings
end
