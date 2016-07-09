# frozen_string_literal: true
class Comment < ApplicationRecord
  include PublicActivity::Model
  tracked owner: proc { |controller, _model| controller.current_user }
  
  validates :content, presence: true

  belongs_to :user
  belongs_to :issue
end
