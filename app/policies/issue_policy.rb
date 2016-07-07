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
    update?
  end

  def unvote?
    update?
  end
end
