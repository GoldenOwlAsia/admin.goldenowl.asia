# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pagy::Backend
  layout :layout_by_resource

  DEFAULT_PER_PAGE = 6
  MAX_PER_PAGE = 25

  private

  def layout_by_resource
    devise_controller? ? 'devise' : 'application'
  end

  def per_page
    return DEFAULT_PER_PAGE if params[:size].blank?

    params[:size].to_i > MAX_PER_PAGE ? DEFAULT_PER_PAGE : params[:size]
  end
end
