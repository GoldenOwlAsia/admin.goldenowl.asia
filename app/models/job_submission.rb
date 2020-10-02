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
class JobSubmission < ApplicationRecord
  after_create_commit :send_mail_to_admin

  belongs_to :career, optional: true

  validates :full_name, presence: true
  validates :email, presence: true

  scope :search, ->(search_string) { where('lower(email) LIKE ?', "%#{search_string.downcase}%") }

  private

  def send_mail_to_admin
    JobSubmissionMailer.job_submission_admin_mailer(ENV['MAIL_ADMIN_SENDER'], id).deliver_later
  end
end
