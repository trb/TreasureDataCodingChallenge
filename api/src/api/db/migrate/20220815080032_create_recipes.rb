class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :uuid
      t.string :name
      t.string :description
      t.text :process
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
