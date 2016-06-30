# frozen_string_literal: true
class Issue < ActiveRecord::Base
  include PublicActivity::Model
  tracked

  validates :user, :title, :description, presence: true

  belongs_to :issue_type
end
