# == Schema Information
#
# Table name: teches
#
#  id         :bigint           not null, primary key
#  name       :string
#  tech_type  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Tech < ApplicationRecord
  enum tech_type: { frontend: 0, backend: 1, db: 2 }
  has_and_belongs_to_many :projects
  has_many :developer_teches
  has_many :developers, through: :developer_teches
  validates :name, presence: true, uniqueness: true
  validates :tech_type, presence: true
end
