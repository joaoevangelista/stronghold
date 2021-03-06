# frozen_string_literal: true
# :nodoc:
class Event < ApplicationRecord
  include PublicActivity::Model
  tracked owner: proc { |controller, _model| controller.current_user }

  validates :user, :title, :time, :description, presence: true

  paginates_per 20

  belongs_to :user
end
