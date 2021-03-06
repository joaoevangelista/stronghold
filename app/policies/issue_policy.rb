# frozen_string_literal: true
# Issue Policies
class IssuePolicy < ApplicationPolicy
  def open?
    update?
  end

  def close?
    update?
  end

  def upvote?
    @user
  end

  def unvote?
    @user
  end
end
