class CreateBearers < ActiveRecord::Migration[6.1]
  def change
    create_table :bearers do |t|
      t.string :name, unique: true
      t.string :email
      t.integer :age

      t.timestamps
    end
  end
end
