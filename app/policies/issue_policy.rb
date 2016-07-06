# Issue Policies
class IssuePolicy < ApplicationPolicy
  def open?
    @resource.user.eql? @user
  end

  def close?
    @resource.user.eql? @user
  end
end
