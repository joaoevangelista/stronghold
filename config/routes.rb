# frozen_string_literal: true
Rails.application.routes.draw do
  get '/' => 'home#index', as: :root

  get 'achievements' => 'achievements#index', as: :achievements
  get 'achievements/:id' => 'achievements#show', as: :achievement

  get 'activities' => 'activity#index', as: :activities

  resources :announcements do
    put :mark_as_read_by, on: :member
  end

  resources :events

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
