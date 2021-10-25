class CreateStocks < ActiveRecord::Migration[6.1]
  def change
    create_table :stocks do |t|
      t.string :name, unique: true
      t.string :ticker
      t.decimal :last_price, precision: 6, scale: 2
      t.boolean :enabled, default: true

      t.timestamps
    end
  end
end
