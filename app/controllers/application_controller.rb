# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pagy::Backend
  layout :layout_by_resource

  DEFAULT_PER_PAGE = 6
  MAX_PER_PAGE = 20

  private

  def layout_by_resource
    devise_controller? ? 'devise' : 'application'
  end

  def per_page
    return DEFAULT_PER_PAGE if params[:size].blank?

    params[:size].to_i > MAX_PER_PAGE ? MAX_PER_PAGE : params[:size]
  end

  def get_pagination_url(pagy_items, pagy_page, controller_name)
    return if pagy_page.blank?

    "#{ENV["ADMIN_PANEL_#{controller_name.upcase}_URL"]}?size=#{pagy_items}&page=#{pagy_page}"
  end
end
