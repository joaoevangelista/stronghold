# frozen_string_literal: true
class Issue < ActiveRecord::Base
  include PublicActivity::Model
  tracked

  validates :user, :title, :description, presence: true
  validates :title, :description, allow_blank: false

  belongs_to :issue_type
  belongs_to :user
end
