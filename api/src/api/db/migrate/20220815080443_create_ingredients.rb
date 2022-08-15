class CreateIngredients < ActiveRecord::Migration[7.0]
  def change
    create_table :ingredients do |t|
      t.string :uuid
      t.string :name
      t.integer :calories_per_100g

      t.timestamps
    end
  end
end
