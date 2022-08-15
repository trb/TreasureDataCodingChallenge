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
class Rating < ApplicationRecord
  include ::UseUuid
  belongs_to :user
  belongs_to :recipe
end
