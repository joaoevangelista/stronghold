# frozen_string_literal: true
class IssueType < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }
  
  validates :name, presence: true
  validates :color, color: true

  has_many :issues
end
