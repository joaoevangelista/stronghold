# frozen_string_literal: true
class IssueType < ActiveRecord::Base
  include PublicActivity::Model
  tracked

  validates :name, presence: true

  has_many :issues
end
