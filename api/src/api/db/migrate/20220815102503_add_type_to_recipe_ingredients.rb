class AddTypeToRecipeIngredients < ActiveRecord::Migration[7.0]
  def change
    add_column :recipe_ingredients, :type, :string
  end
end
