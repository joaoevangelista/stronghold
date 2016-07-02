# frozen_string_literal: true
# :nodoc:
class Announcement < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: proc { |controller, _model| controller.current_user }

  validates :user, :title, :description, presence: true

  belongs_to :user
end
