# frozen_string_literal: true

module Api
  module V1
    class ActivitiesController < ApplicationController
      before_action :set_activity, only: %i[show edit update destroy]

      def index
        @pagy, @activities = pagy(extract_activity, items: per_page)

        links = {
          preview_page_url: get_pagination_url(@pagy.items, @pagy.prev, 'activity'),
          next_page_url: get_pagination_url(@pagy.items, @pagy.next, 'activity')
        }

        render json: ActivitySerializer.new(@activities, links: links)
      end

      def show
        render json: ActivitySerializer.new(@activity)
      end

      private

      def set_activity
        @activity = Activity.friendly.find(params[:id])
      end

      def activity_params
        params.require(:activity).permit(
          :title, :content, :category, :start_day, :end_day, :image
        )
      end

      def extract_activity
        if params[:search]
          Activity.search(params[:search])
        else
          Activity.all.order(id: :desc)
        end
      end
    end
  end
end
