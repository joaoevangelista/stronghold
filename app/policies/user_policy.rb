# frozen_string_literal: true
# Policies for user
class UserPolicy < ApplicationPolicy

  # Only managers has the hability to create users
  def create?
    @user.has_role? :manager
  end
end
