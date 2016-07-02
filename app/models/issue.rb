# frozen_string_literal: true
class Issue < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: proc { |controller, _model| controller.current_user }

  validates :user, :title, :description, presence: true

  belongs_to :issue_type
  belongs_to :user
end
