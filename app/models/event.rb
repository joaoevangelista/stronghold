# frozen_string_literal: true
class Event < ActiveRecord::Base
  include PublicActivity::Model
  tracked

  belongs_to :user
end
