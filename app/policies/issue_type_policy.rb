# frozen_string_literal: true
# Issue Type Policy
class IssueTypePolicy < ApplicationPolicy
  def destroy?
    @resource.user.eql?(@user) || @user.has_role?(:manager)
  end
end
