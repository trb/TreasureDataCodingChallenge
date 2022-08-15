# == Schema Information
#
# Table name: recipe_ingredients
#
#  id               :integer          not null, primary key
#  uuid             :string
#  amount           :string
#  ingredient_id    :integer          not null
#  recipe_id        :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  measurement_type :string
#
require "test_helper"

class RecipeIngredientTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
