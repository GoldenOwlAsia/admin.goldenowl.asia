# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::ActivitiesController, type: :controller do
  describe 'GET index without pagy' do
    let!(:activity) { create(:activity, :with_image_from_file) }

    it 'has a 200 status code' do
      get :index
      expect(response.status).to eq(200)
    end

    it 'returns all the actitity' do
      get :index, format: :json
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['data'].length).to eq(1)
    end
  end

  describe 'GET Index with Pagy' do
    let!(:activity_lists) { create_list(:activity, 4, :with_image_from_file) }
    it 'return first page' do
      get :index, params: { size: 2, page: 1 }
      parsed_response = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(parsed_response['data']).to_not be_nil
      expect(parsed_response['data'][0]['id']).to eq activity_lists[3].id.to_s
      expect(parsed_response['data'][1]['id']).to eq activity_lists[2].id.to_s
      expect(parsed_response['links']['preview_page_url']).to be_nil
      expect(parsed_response['links']['next_page_url'])
        .to eq "#{ENV['ADMIN_PANEL_ACTIVITY_URL']}?size=2&page=2"
    end

    it 'return last page' do
      get :index, params: { size: 2, page: 2 }
      parsed_response = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(parsed_response['data']).to_not be_nil
      expect(parsed_response['data'][0]['id']).to eq activity_lists[1].id.to_s
      expect(parsed_response['data'][1]['id']).to eq activity_lists[0].id.to_s
      expect(parsed_response['links']['preview_page_url'])
        .to eq "#{ENV['ADMIN_PANEL_ACTIVITY_URL']}?size=2&page=1"

      expect(parsed_response['links']['next_page_url']).to be_nil
    end
  end

  describe "GET 'show' " do
    let!(:activity) { create(:activity, :with_image_from_file) }

    it 'returns data of a single activity' do
      get :show, params: { id: activity.id }, format: :json
      expect(response.status).to eq(200)
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['data']).to_not be_nil
    end
  end
end
