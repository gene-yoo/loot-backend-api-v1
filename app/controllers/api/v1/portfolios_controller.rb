class Api::V1::PortfoliosController < ApplicationController
  def create
    binding.pry
  end

  def update
  end

  def delete
  end

  private

  def portfolio_params
    params.require(:portfolio).permit(:name, :description, :user_id, initialCoins: [])
  end
end
