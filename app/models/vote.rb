# A vote of an user on an issue
class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :issue

  # Add a vote to the specific issue on behalf of user
  def self.upvote(user, issue)
    vote = Vote.find_by user: user, issue: issue
    unless vote
     new_vote = Vote.new(user: user, issue: issue)
     new_vote.save
   else
     false
    end
  end

  # Remove the vote of an user in at specific issue
  def self.unvote(user, issue)
    vote = Vote.find_by user: user, issue: issue
    if vote
      return vote.destroy
    else
      false
    end
  end
end
