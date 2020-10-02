class MixFirstnameAndLastnameIntoFullnameOnJobSubmissions < ActiveRecord::Migration[6.0]
  def change
    add_column :job_submissions, :full_name, :string
    remove_column :job_submissions, :first_name, :string
    remove_column :job_submissions, :last_name, :string
  end
end
