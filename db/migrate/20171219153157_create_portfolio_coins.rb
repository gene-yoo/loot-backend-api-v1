class CreatePortfolioCoins < ActiveRecord::Migration[5.1]
  def change
    create_table :portfolio_coins do |t|
      t.decimal :trans_price
      t.decimal :trans_amt
      t.string :trans_type
      t.decimal :quantity
      t.string :paper_currency
      t.references :portfolio, foreign_key: true
      t.references :coin, foreign_key: true

      t.timestamps
    end
  end
end
