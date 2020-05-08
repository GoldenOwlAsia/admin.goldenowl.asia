# == Schema Information
#
# Table name: career_forms
#
#  id         :bigint           not null, primary key
#  email      :string           not null
#  feedback   :string           not null
#  first_name :string           not null
#  last_name  :string           not null
#  portfolio  :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class CareerForm < ApplicationRecord
  belongs_to :career
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, confirmation: true, presence: true
  validates :portfolio, presence: true
  validates :feedback, presence: true
end
