# frozen_string_literal: true
# Issue Type Policy
class IssueTypePolicy < ApplicationPolicy
  def destroy?
    @user.has_role?(:manager)
  end

  def update?
    @user.has_role? :manager
  end
end
