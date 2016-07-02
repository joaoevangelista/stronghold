# frozen_string_literal: true
require 'rails_helper'

RSpec.describe IssuesController, type: :controller do
  login_user

  let(:valid_attributes) do
    { title: 'Pool floor is damaged!',
      description: 'The floor is damaged by something strange',
      user_id: 1, assignee_id: 1, issue_type_id: 1 }
  end

  let(:invalid_attributes) do
    { title: '',
      description: 'The floor is damaged by something strange',
      user_id: 1, assignee_id: 1, issue_type_id: 1 }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # IssuesController. Be sure to keep this updated too.
  let(:valid_session) { User.where(email: 'daisy@stronghold.com') || FactoryGirl.create(:user) }

  describe 'GET #index' do
    it 'assigns all issues as @issues' do
      issue = Issue.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:issues)).to eq([issue])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested issue as @issue' do
      issue = Issue.create! valid_attributes
      get :show, { id: issue.to_param }, valid_session
      expect(assigns(:issue)).to eq(issue)
    end
  end

  describe 'GET #new' do
    it 'assigns a new issue as @issue' do
      get :new, {}, valid_session
      expect(assigns(:issue)).to be_a_new(Issue)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested issue as @issue' do
      issue = Issue.create! valid_attributes
      get :edit, { id: issue.to_param }, valid_session
      expect(assigns(:issue)).to eq(issue)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Issue' do
        expect do
          post :create, { issue: valid_attributes }, valid_session
        end.to change(Issue, :count).by(1)
      end

      it 'assigns a newly created issue as @issue' do
        post :create, { issue: valid_attributes }, valid_session
        expect(assigns(:issue)).to be_a(Issue)
        expect(assigns(:issue)).to be_persisted
      end

      it 'redirects to the created issue' do
        post :create, { issue: valid_attributes }, valid_session
        expect(response).to redirect_to(Issue.last)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved issue as @issue' do
        post :create, { issue: invalid_attributes }, valid_session
        expect(assigns(:issue)).to be_a_new(Issue)
      end

      it "re-renders the 'new' template" do
        post :create, { issue: invalid_attributes }, valid_session
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested issue' do
        issue = Issue.create! valid_attributes
        put :update, { id: issue.to_param, issue: new_attributes }, valid_session
        issue.reload
        skip('Add assertions for updated state')
      end

      it 'assigns the requested issue as @issue' do
        issue = Issue.create! valid_attributes
        put :update, { id: issue.to_param, issue: valid_attributes }, valid_session
        expect(assigns(:issue)).to eq(issue)
      end

      it 'redirects to the issue' do
        issue = Issue.create! valid_attributes
        put :update, { id: issue.to_param, issue: valid_attributes }, valid_session
        expect(response).to redirect_to(issue)
      end
    end

    context 'with invalid params' do
      it 'assigns the issue as @issue' do
        issue = Issue.create! valid_attributes
        put :update, { id: issue.to_param, issue: invalid_attributes }, valid_session
        expect(assigns(:issue)).to eq(issue)
      end

      it "re-renders the 'edit' template" do
        issue = Issue.create! valid_attributes
        put :update, { id: issue.to_param, issue: invalid_attributes }, valid_session
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested issue' do
      issue = Issue.create! valid_attributes
      expect do
        delete :destroy, { id: issue.to_param }, valid_session
      end.to change(Issue, :count).by(-1)
    end

    it 'redirects to the issues list' do
      issue = Issue.create! valid_attributes
      delete :destroy, { id: issue.to_param }, valid_session
      expect(response).to redirect_to(issues_url)
    end
  end
end
