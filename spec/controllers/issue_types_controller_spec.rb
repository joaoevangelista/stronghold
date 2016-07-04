# frozen_string_literal: true
require 'rails_helper'

RSpec.describe IssueTypesController, type: :controller do
  # Need to be always authenticated
  login_user

  let(:valid_attributes) do
    { name: 'Improvement', color: '#ff5555' }
  end

  let(:invalid_attributes) do
    # Mismatch color
    { name: 'Improvement', color: 'fff' }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # IssueTypesController. Be sure to keep this updated too.
  let(:valid_session) do
    User.where(email: 'daisy@stronghold.com') ||
      FactoryGirl.create(:user)
  end

  describe 'GET #index' do
    it 'assigns all issue_types as @issue_types' do
      issue_type = IssueType.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:issue_types)).to eq([issue_type])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested issue_type as @issue_type' do
      issue_type = IssueType.create! valid_attributes
      get :show, { id: issue_type.to_param }, valid_session
      expect(assigns(:issue_type)).to eq(issue_type)
    end
  end

  describe 'GET #new' do
    it 'assigns a new issue_type as @issue_type' do
      get :new, {}, valid_session
      expect(assigns(:issue_type)).to be_a_new(IssueType)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested issue_type as @issue_type' do
      issue_type = IssueType.create! valid_attributes
      get :edit, { id: issue_type.to_param }, valid_session
      expect(assigns(:issue_type)).to eq(issue_type)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new IssueType' do
        expect do
          post :create, { issue_type: valid_attributes }, valid_session
        end.to change(IssueType, :count).by(1)
      end

      it 'assigns a newly created issue_type as @issue_type' do
        post :create, { issue_type: valid_attributes }, valid_session
        expect(assigns(:issue_type)).to be_a(IssueType)
        expect(assigns(:issue_type)).to be_persisted
      end

      it 'redirects to the created issue_type' do
        post :create, { issue_type: valid_attributes }, valid_session
        expect(response).to redirect_to(IssueType.last)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved issue_type as @issue_type' do
        post :create, { issue_type: invalid_attributes }, valid_session
        expect(assigns(:issue_type)).to be_a_new(IssueType)
      end

      it "re-renders the 'new' template" do
        post :create, { issue_type: invalid_attributes }, valid_session
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested issue_type' do
        issue_type = IssueType.create! valid_attributes
        put :update, { id: issue_type.to_param, issue_type: new_attributes }, valid_session
        issue_type.reload
        skip('Add assertions for updated state')
      end

      it 'assigns the requested issue_type as @issue_type' do
        issue_type = IssueType.create! valid_attributes
        put :update, { id: issue_type.to_param, issue_type: valid_attributes }, valid_session
        expect(assigns(:issue_type)).to eq(issue_type)
      end

      it 'redirects to the issue_type' do
        issue_type = IssueType.create! valid_attributes
        put :update, { id: issue_type.to_param, issue_type: valid_attributes }, valid_session
        expect(response).to redirect_to(issue_type)
      end
    end

    context 'with invalid params' do
      it 'assigns the issue_type as @issue_type' do
        issue_type = IssueType.create! valid_attributes
        put :update, { id: issue_type.to_param, issue_type: invalid_attributes }, valid_session
        expect(assigns(:issue_type)).to eq(issue_type)
      end

      it "re-renders the t('links.edit') template" do
        issue_type = IssueType.create! valid_attributes
        put :update, { id: issue_type.to_param, issue_type: invalid_attributes }, valid_session
        expect(response).to render_template(t('links.edit'))
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested issue_type' do
      issue_type = IssueType.create! valid_attributes
      expect do
        delete :destroy, { id: issue_type.to_param }, valid_session
      end.to change(IssueType, :count).by(-1)
    end

    it 'redirects to the issue_types list' do
      issue_type = IssueType.create! valid_attributes
      delete :destroy, { id: issue_type.to_param }, valid_session
      expect(response).to redirect_to(issue_types_url)
    end
  end
end
