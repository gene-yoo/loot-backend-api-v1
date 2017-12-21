class PortfolioSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :transactions
end
