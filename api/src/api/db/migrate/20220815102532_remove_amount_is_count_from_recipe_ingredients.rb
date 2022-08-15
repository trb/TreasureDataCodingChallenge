class RemoveAmountIsCountFromRecipeIngredients < ActiveRecord::Migration[7.0]
  def change
    remove_column(:recipe_ingredients, :amount_is_count)
  end
end
