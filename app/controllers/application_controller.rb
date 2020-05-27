# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pagy::Backend
  layout :layout_by_resource

  DEFAULT_PER_PAGE = 6

  private

  def layout_by_resource
    devise_controller? ? 'devise' : 'application'
  end

  def per_page
    params[:size] || DEFAULT_PER_PAGE
  end
end
