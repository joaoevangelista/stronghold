# frozen_string_literal: true
# :nodoc:
class Issue < ApplicationRecord
  include PublicActivity::Model
  tracked owner: proc { |controller, _model| controller.current_user }

  validates :user, :title, :description, presence: true

  paginates_per 20

  belongs_to :issue_type
  belongs_to :user
  has_many :votes
end
