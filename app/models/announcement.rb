# frozen_string_literal: true
class Announcement < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }
  
  validates :user, :title, :description, presence: true

  belongs_to :user
end
