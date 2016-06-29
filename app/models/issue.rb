# frozen_string_literal: true
class Issue < ActiveRecord::Base
  include PublicActivity::Model
  tracked
end
