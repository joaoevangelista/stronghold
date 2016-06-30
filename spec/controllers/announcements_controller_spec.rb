# frozen_string_literal: true
require 'rails_helper'

RSpec.describe AnnouncementsController, type: :controller do

  login_user

  let(:valid_attributes) do
    {title: 'New rules', description: 'As discussed today...', user_id: 1}
  end

  let(:invalid_attributes) do
    # Missing title and user
    {description: 'As discussed today...'}
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # AnnouncementsController. Be sure to keep this updated too.
  let(:valid_session) {
    User.where(email: 'daisy@keep.com') || FactoryGirl.create(:user)
  }

  describe 'GET #index' do
    it 'assigns all announcements as @announcements' do
      announcement = Announcement.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:announcements)).to eq([announcement])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested announcement as @announcement' do
      announcement = Announcement.create! valid_attributes
      get :show, { id: announcement.to_param }, valid_session
      expect(assigns(:announcement)).to eq(announcement)
    end
  end

  describe 'GET #new' do
    it 'assigns a new announcement as @announcement' do
      get :new, {}, valid_session
      expect(assigns(:announcement)).to be_a_new(Announcement)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested announcement as @announcement' do
      announcement = Announcement.create! valid_attributes
      get :edit, { id: announcement.to_param }, valid_session
      expect(assigns(:announcement)).to eq(announcement)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Announcement' do
        expect do
          post :create, { announcement: valid_attributes }, valid_session
        end.to change(Announcement, :count).by(1)
      end

      it 'assigns a newly created announcement as @announcement' do
        post :create, { announcement: valid_attributes }, valid_session
        expect(assigns(:announcement)).to be_a(Announcement)
        expect(assigns(:announcement)).to be_persisted
      end

      it 'redirects to the created announcement' do
        post :create, { announcement: valid_attributes }, valid_session
        expect(response).to redirect_to(Announcement.last)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved announcement as @announcement' do
        post :create, { announcement: invalid_attributes }, valid_session
        expect(assigns(:announcement)).to be_a_new(Announcement)
      end

      it "re-renders the 'new' template" do
        post :create, { announcement: invalid_attributes }, valid_session
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        {
          title: 'New rules', description: 'As discussed today we are going to...',
          user_id: 1
        }
      end

      it 'updates the requested announcement' do
        announcement = Announcement.create! valid_attributes
        put :update, {
          id: announcement.to_param, announcement: new_attributes
          }, valid_session
          announcement.reload
          expect(announcement.title).to eq('New rules')
          expect(announcement.description).to eq('As discussed today we are going to...')
        end

        it 'assigns the requested announcement as @announcement' do
          announcement = Announcement.create! valid_attributes
          put :update, {
            id: announcement.to_param, announcement: valid_attributes
            }, valid_session
            expect(assigns(:announcement)).to eq(announcement)
          end

          it 'redirects to the announcement' do
            announcement = Announcement.create! valid_attributes
            put :update, {
              id: announcement.to_param, announcement: valid_attributes
              }, valid_session
              expect(response).to redirect_to(announcement)
            end
          end
        end

        describe 'DELETE #destroy' do
          it 'destroys the requested announcement' do
            announcement = Announcement.create! valid_attributes
            expect do
              delete :destroy, { id: announcement.to_param }, valid_session
            end.to change(Announcement, :count).by(-1)
          end

          it 'redirects to the announcements list' do
            announcement = Announcement.create! valid_attributes
            delete :destroy, { id: announcement.to_param }, valid_session
            expect(response).to redirect_to(announcements_url)
          end
        end
      end
