# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(params[:id])
    # @user = User.all
  end
end
