class JobSubmissionMailer < ApplicationMailer
  helper MailerHelper

  def job_submission_admin_mailer(email, job_submission_id = nil)
    @job_submission = JobSubmission.find_by(id: job_submission_id)
    return if email.nil? || @job_submission.nil?

    mail(to: email, subject: 'Job Submission')
  end
end
