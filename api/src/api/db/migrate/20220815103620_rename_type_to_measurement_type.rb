class RenameTypeToMeasurementType < ActiveRecord::Migration[7.0]
  def change
    rename_column :recipe_ingredients, :type, :measurement_type
  end
end
