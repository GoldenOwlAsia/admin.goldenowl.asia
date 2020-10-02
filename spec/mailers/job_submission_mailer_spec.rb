require 'rails_helper'

RSpec.describe JobSubmissionMailer, type: :mailer do
  describe 'job_submission_admin_mailer' do
    let!(:career) { FactoryBot.create(:career) }
    let!(:job_submission) { FactoryBot.create(:job_submission) }
    let!(:receiver_email) { ENV['MAIL_ADMIN_SENDER'] }
    let!(:mail) {
      JobSubmissionMailer.job_submission_admin_mailer(
        receiver_email, job_submission.id
      )
    }

    it 'renders the headers' do
      expect(mail.subject).to eq('Job Submission')
      expect(mail.to).to eq([ENV['MAIL_ADMIN_SENDER']])
      expect(mail.from).to eq([ENV['MAIL_ADMIN_SENDER']])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to include(career.title)
      expect(mail.body.encoded).to include(job_submission.full_name)
      expect(mail.body.encoded).to include(job_submission.email)
    end
  end
end
