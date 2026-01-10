class CreateCaffeineIntakes < ActiveRecord::Migration[8.1]
  def change
    create_table :caffeine_intakes do |t|
      t.references :beverage, null: false, foreign_key: true
      t.datetime :consumed_at, null: false
      t.integer :quantity, null: false, default: 1

      t.timestamps
    end

    add_index :caffeine_intakes, :consumed_at
  end
end
