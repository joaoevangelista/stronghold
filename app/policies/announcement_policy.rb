# frozen_string_literal: true
# Annoncement Policies
class AnnouncementPolicy < ApplicationPolicy
  # Only managers can create new announcements
  def create?
    @user.has_role? :manager
  end
end
