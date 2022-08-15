# == Schema Information
#
# Table name: ratings
#
#  id         :integer          not null, primary key
#  uuid       :string
#  user_id    :integer          not null
#  recipe_id  :integer          not null
#  rating     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class RatingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
