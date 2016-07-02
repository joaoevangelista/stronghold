# frozen_string_literal: true
# :nodoc:
class ActivityController < AuthenticatedController
  def index
    @activities = PublicActivity::Activity.order('created_at DESC')
  end
end
