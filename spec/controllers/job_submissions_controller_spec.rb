require 'rails_helper'

RSpec.describe Api::V1::JobSubmissionsController, type: :controller do
  describe 'GET index' do
    let!(:user) { create(:user)}

    context 'user login' do
      it 'has a 200 status code' do
        sign_in user
        get :index

        expect(response.status).to eq(200)
      end
    end
  end
end
