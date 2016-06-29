# frozen_string_literal: true
class Announcement < ActiveRecord::Base
  include PublicActivity::Model
  tracked

  belongs_to :user
end
