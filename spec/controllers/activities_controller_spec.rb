require 'rails_helper'

RSpec.describe ActivitiesController, type: :controller do
  let!(:user) { create(:user) }
  before { sign_in user }

  describe 'factorybot create success' do
    let(:activity) { create(:activity, :with_image_from_file) }
    it 'has a valid factory' do
      expect(activity).to be_valid
    end
  end

  describe 'GET method' do
    context 'get index' do
      it 'render the posts#index' do
        get :index
        expect(response).to render_template :index
      end
    end

    context 'when call show method' do
      let(:activity) { create(:activity, :with_image_from_file) }

      it 'render the posts#show' do
        get :show, params: { id: activity.id}
        expect(response).to render_template :show
      end
    end

    context 'when call new method' do
      it 'render the posts#index' do
        get :new
        expect(response).to render_template :new
      end
    end

    context 'when call edit method' do
      let(:activity) { create(:activity, :with_image_from_file) }

      it 'render the posts#edit' do
        get :edit, params: { id: activity.id}
        expect(response).to render_template :edit
      end
    end
  end

  describe 'POST create' do
    context 'with invalid attributes' do
      let(:invalid_activity) { attributes_for(:activity, :invalid_activity, :with_image_from_file) }

      it 'Activity was not created' do
        expect { post :create, params: { activity: invalid_activity } }
          .not_to change(Activity, :count)
      end
    end

    context 'when successfully created' do
      let(:valid_activity) { attributes_for(:activity, :with_image_from_file) }

      it 'create a new activity' do
        expect { post :create, params: { activity: valid_activity } }
          .to change { Activity.count }.by(1)
      end
    end
  end

  describe 'PATCH #update' do
    let(:activity) { create(:activity, :with_image_from_file) }

    context 'when failed to save activity' do
      let(:invalid_activity) { attributes_for(:activity, :invalid_activity, :with_image_from_file) }
      it 'does not update activity' do
        expect { patch :update, params: { id: activity.id, activity: invalid_activity } }.not_to change(activity, :title)
      end
    end

    context 'when save activity successfully' do
      let(:new_title) { 'new_title' }
      let(:old_title) { activity.title }

      it 'does not create a new activity' do
        expect do
          patch :update, params: { id: activity.id, activity: { title: new_title } }
          activity.reload
        end.to change { activity.title }.from(old_title).to(new_title)
      end
    end
  end
end
