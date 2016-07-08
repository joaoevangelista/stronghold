# frozen_string_literal: true
Rails.application.routes.draw do

  get '/' => 'home#index', as: :root

  get 'activities' => 'activity#index', as: :activities

  resources :events

  resources :announcements do
    put :mark_as_read_by, on: :member
  end

  resources :issues do

    put :open, on: :member
    delete :close, on: :member

    put :vote, on: :member, action: :upvote
    delete :vote, on: :member, action: :unvote

    resources :comments
  end

  resources :issue_types

  devise_for :users, controllers: { registrations: 'registrations' }
  
end
