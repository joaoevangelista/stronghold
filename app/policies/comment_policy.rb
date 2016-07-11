# frozen_string_literal: true
# :nodoc:
class CommentPolicy < ApplicationPolicy
  def destroy?
    @record.user.eql? @user
  end
end
