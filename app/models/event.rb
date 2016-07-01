# frozen_string_literal: true
class Event < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }
  
  validates :user, :title, :description, presence: true

  paginates_per 20

  belongs_to :user
end
