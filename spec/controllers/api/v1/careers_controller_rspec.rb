require 'rails_helper'

RSpec.describe Api::V1::CareersController, type: :controller do
  describe 'action' do
    let!(:career) { create(:career) }

    describe 'GET index' do

      it 'has a 200 status code' do
        get :index
        expect(response.status).to eq(200)
      end

      it 'returns all the career' do
        get :index, format: :json
        parsed_response = JSON.parse(response.body)
        expect(parsed_response['data'].length).to eq(1)
      end
    end

    describe 'GET show' do
      it 'has a 200 status code' do
        get :index
        expect(response.status).to eq(200)
      end

      it 'returns the career' do
        get :show, params: { id: career.id }, format: :json
        parsed_response = JSON.parse(response.body)
        expect(parsed_response['data']['attributes']['title']).to eq(career.title)
      end
    end
  end
end
