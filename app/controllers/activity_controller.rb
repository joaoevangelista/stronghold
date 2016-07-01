# frozen_string_literal: true
class ActivityController < AuthenticatedController
  def index
    @activities =  PublicActivity::Activity.order('created_at DESC')
  end
end
