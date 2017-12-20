class CreatePortfolios < ActiveRecord::Migration[5.1]
  def change
    create_table :portfolios do |t|
      t.string :name
      t.string :description
      t.decimal :balance
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
