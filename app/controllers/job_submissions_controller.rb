class JobSubmissionsController < ApplicationController
  def index
    @pagy, @job_submissions = pagy(extract_subscription, items: per_page)
  end

  def extract_subscription
    if params[:search]
      JobSubmission.search(params[:search])
    else
      JobSubmission.all.order(id: :desc)
    end
  end
end
