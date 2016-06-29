# frozen_string_literal: true
class IssueType < ActiveRecord::Base
  include PublicActivity::Model
  tracked

  has_many :issues
end
