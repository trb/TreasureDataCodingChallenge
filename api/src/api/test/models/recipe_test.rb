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
require "test_helper"

class RecipeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
