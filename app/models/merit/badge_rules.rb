# frozen_string_literal: true
# Be sure to restart your server when you modify this file.
#
# +grant_on+ accepts:
# * Nothing (always grants)
# * A block which evaluates to boolean (recieves the object as parameter)
# * A block with a hash composed of methods to run on the target object with
#   expected values (+votes: 5+ for instance).
#
# +grant_on+ can have a +:to+ method name, which called over the target object
# should retrieve the object to badge (could be +:user+, +:self+, +:follower+,
# etc). If it's not defined merit will apply the badge to the user who
# triggered the action (:action_user by default). If it's :itself, it badges
# the created object (new user for instance).
#
# The :temporary option indicates that if the condition doesn't hold but the
# badge is granted, then it's removed. It's false by default (badges are kept
# forever).
module Merit
  # :nodoc:
  class BadgeRules
    include Merit::BadgeRulesMethods

    def initialize
      # If it creates user, grant badge
      # Should be "current_user" after registration for badge to be granted.
      # Find badge by badge_id, badge_id takes presidence over badge
      # grant_on 'users#create', badge_id: 7, badge: 'just-registered', to: :itself

      # If it has 10 comments, grant commenter-10 badge
      # grant_on 'comments#create', badge: 'commenter', level: 10 do |comment|
      #   comment.user.comments.count == 10
      # end

      # If it has 5 votes, grant relevant-commenter badge
      # grant_on 'comments#vote', badge: 'relevant-commenter',
      #   to: :user do |comment|
      #
      #   comment.votes.count == 5
      # end

      # Changes his name by one wider than 4 chars (arbitrary ruby code case)
      # grant_on 'registrations#update', badge: 'autobiographer',
      #   temporary: true, model_name: 'User' do |user|
      #
      #   user.name.length > 4
      # end

      grant_on 'announcements#create', badge_id: 2, to: :action_user do |announcement|
        announcement.user.announcements.count == 1
      end

      grant_on 'issues#create', badge_id: 1, to: :action_user do |issue|
        issue.user.issues.count == 1
      end

      grant_on 'comments#create', badge_id: 4, to: :action_user do |comment|
        user = comment.user
        Comment.count_by_user_distinct_issue(user) == 5
      end

      grant_on 'comments#create', badge_id: 5, to: :action_user do |comment|
        comment.user.comments.count == 1
      end

      grant_on 'issues#create', badge_id: 9, to: :action_user do |issue|
        Issue.count_by_user(issue.user) == 20
      end
    end
  end
end
