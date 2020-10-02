# == Schema Information
#
# Table name: job_submissions
#
#  id         :bigint           not null, primary key
#  answer     :text
#  cv_upload  :string
#  email      :string           not null
#  first_name :string           not null
#  last_name  :string           not null
#  port_folio :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  careers_id :bigint
#
# Indexes
#
#  index_job_submissions_on_careers_id  (careers_id)
#
FactoryBot.define do
  factory :job_submission do
    full_name { Faker::Name.name }
    email { Faker::Internet.email }
    cv_upload { 'drives.google.com/public/system/files/abc.pdf' }
    port_folio { 'MyString' }
    association :career
  end

  trait :invaid_job_submission do
    full_name { '' }
    email { '' }
    port_folio { '' }
    cv_upload { '' }
  end
end
