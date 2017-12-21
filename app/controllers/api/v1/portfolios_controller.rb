class Api::V1::PortfoliosController < ApplicationController
  def create
    portfolio = Portfolio.create(name: portfolio_params[:name], description: portfolio_params[:description], user_id: portfolio_params[:user_id])

    if portfolio.valid?
      portfolio.balance -= 2000
      portfolio.initialCoins = portfolio_params[:initialCoins]
      portfolio.save
      render json: portfolio
    else
      render json: {error: 'You must be playing yoself ... '}, status: 401
    end
  end

  def update
  end

  def delete
  end

  private

  def portfolio_params
    params.require(:portfolio).permit(:name, :description, :user_id, initialCoins: [:coinSymbol, :coinName, :coinPrice])
  end
end
