# == Schema Information
#
# Table name: job_submissions
#
#  id         :bigint           not null, primary key
#  answer     :text
#  cv_upload  :string
#  email      :string           not null
#  full_name  :string
#  port_folio :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  career_id  :integer
#
# Foreign Keys
#
#  fk_rails_...  (career_id => careers.id)
#
class JobSubmissionSerializer
  include FastJsonapi::ObjectSerializer

  attributes :full_name, :email, :cv_upload, :port_folio
end
