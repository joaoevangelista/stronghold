# frozen_string_literal: true
class Announcement < ActiveRecord::Base
  include PublicActivity::Model
  tracked

  validates :user, :title, :description, presence: true
  
  belongs_to :user
end
