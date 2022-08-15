# == Schema Information
#
# Table name: ingredients
#
#  id                :integer          not null, primary key
#  uuid              :string
#  name              :string
#  calories_per_100g :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
require "test_helper"

class IngredientTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
