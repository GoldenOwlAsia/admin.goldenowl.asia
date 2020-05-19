class AddFileToJobSubmission < ActiveRecord::Migration[6.0]
  def up
    add_attachment :job_submissions, :cv_upload
  end

  def down
    remove_attachment :job_submissions, :cv_upload
  end
end
