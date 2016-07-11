# frozen_string_literal: true
# A read represent an user that have read the announcement indicated
class Read < ApplicationRecord
  belongs_to :user
  belongs_to :announcement

  def self.count_by_user(user)
    where(user: user).count
  end
end
