# frozen_string_literal: true
# :nodoc:
class IssueType < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: proc { |controller, _model| controller.current_user }

  validates :name, presence: true
  validates :color, color: true

  has_many :issues, dependent: :nullify
end
