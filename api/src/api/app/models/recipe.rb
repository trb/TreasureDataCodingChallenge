# == Schema Information
#
# Table name: recipes
#
#  id          :integer          not null, primary key
#  uuid        :string
#  name        :string
#  description :string
#  process     :text
#  user_id     :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Recipe < ApplicationRecord
  include ::UseUuid
  belongs_to :user
  has_many :recipeIngredients
  has_many :ratings
end
