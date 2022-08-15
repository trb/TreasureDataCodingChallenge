# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  uuid       :string
#  name       :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
  include UseUuid
end
