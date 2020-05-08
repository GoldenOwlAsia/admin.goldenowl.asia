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
FactoryBot.define do
  factory :career_form do
    
  end
end
