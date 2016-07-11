# frozen_string_literal: true
# :nodoc:
class Comment < ApplicationRecord
  include PublicActivity::Model
  tracked owner: proc { |controller, _model| controller.current_user }

  validates :content, presence: true

  belongs_to :user
  belongs_to :issue

  def self.count_by_user_distinct_issue(user)
    where.(user: user).distinct(:issue_id).count
  end
end
