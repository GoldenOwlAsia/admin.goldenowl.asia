# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @pagy, @users = pagy(retrieve_users_relation, items: per_page)
  end

  private

  def retrieve_users_relation
    if params[:search]
      User.search(params[:search])
    else
      User.all.order(id: :desc)
    end
  end
end
