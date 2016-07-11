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
  has_many :comments

  def self.count_by_user(user)
    Issue.where(user: user).count
  end

  def self.count_by_assignee(assignee)
    Issue.where(assignee_id: assignee).count
  end
end
