# frozen_string_literal: true
# A vote of an user on an issue
class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :issue

  # Add a vote to the specific issue on behalf of user
  def self.upvote(user, issue)
    vote = Vote.find_by user: user, issue: issue
    if vote
      false
    else
      new_vote = Vote.new(user: user, issue: issue)
      new_vote.save
    end
  end

  # Remove the vote of an user in at specific issue
  def self.unvote(user, issue)
    vote = Vote.find_by user: user, issue: issue
    return false unless vote
    vote.destroy
  end

  def self.count_by_voter(user)
    where(user: user).distinct.count
  end
end
