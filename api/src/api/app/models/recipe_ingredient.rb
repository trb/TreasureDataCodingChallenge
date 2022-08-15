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
class RecipeIngredient < ApplicationRecord
  include ::UseUuid
  belongs_to :ingredient
  belongs_to :recipe

  def amount_imperial
    logger.info('yeah')
    logger.info(self[:measurement_type])

    case self[:measurement_type]
    when 'weight'
      Measured::Weight.parse(self[:amount]).convert_to('ounces')
    when 'volume'
      Measured::Volume.parse(self[:amount]).convert_to('fl_oz')
    else
      self[:amount]
    end
  end
end
