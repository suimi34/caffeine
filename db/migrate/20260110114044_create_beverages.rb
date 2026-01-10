class CreateBeverages < ActiveRecord::Migration[8.1]
  def change
    create_table :beverages do |t|
      t.string :name, null: false
      t.integer :caffeine_mg, null: false, default: 0

      t.timestamps
    end

    add_index :beverages, :name, unique: true
  end
end
