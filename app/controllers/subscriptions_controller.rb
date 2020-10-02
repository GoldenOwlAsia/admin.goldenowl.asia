# frozen_string_literal: true

class SubscriptionsController < ApplicationController
  def index
    @pagy, @subscriptions = pagy(extract_subscription, items: per_page)
  end

  private

  def extract_subscription
    if params[:search]
      Subscription.search(params[:search])
    else
      Subscription.all.order(id: :desc)
    end
  end
end
