# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  include Pagy::Backend
  layout :layout_by_resource

  private

  def layout_by_resource
    devise_controller? ? 'devise' : 'application'
  end
end
