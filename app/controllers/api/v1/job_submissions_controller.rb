# frozen_string_literal: true

module Api
  module V1
    class JobSubmissionsController < ApplicationController
      skip_before_action :verify_authenticity_token, only: %i[create]

      def create
        @job_submission = JobSubmission.new(submit_params)
        if @job_submission.save
          data = JobSubmissionSerializer.new(@job_submission).serialized_json
          render json: data, status: :created
        else
          render json: @job_submission.errors, status: :unprocessable_entity
        end
      end

      private

      def submit_params
        params.require(:job_submission).permit(
          :full_name,
          :email,
          :cv_upload,
          :port_folio,
          :career_id
        )
      end
    end
  end
end
