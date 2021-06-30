# == Schema Information
#
# Table name: teches
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Tech < ApplicationRecord
  validates :name,  presence: true, uniqueness: true
end
