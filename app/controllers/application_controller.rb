# frozen_string_literal: true
class ApplicationController < ActionController::Base
  # StoreController to customize owner of public activity
  include PublicActivity::StoreController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
