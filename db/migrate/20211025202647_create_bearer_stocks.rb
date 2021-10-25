class CreateBearerStocks < ActiveRecord::Migration[6.1]
  def change
    create_table :bearer_stocks do |t|
      t.references :bearer, null: false, foreign_key: true, index: true
      t.references :stock, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
