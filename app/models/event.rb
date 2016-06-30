# frozen_string_literal: true
class Event < ActiveRecord::Base
  include PublicActivity::Model
  tracked

  validates :user, :title, :description, presence: true

  belongs_to :user
end
