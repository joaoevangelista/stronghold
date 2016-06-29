# frozen_string_literal: true
class ActivityController < ApplicationController
  def index
    @activities = Kaminari.paginate_array(PublicActivity::Activity.all)
                          .page(param[:page]).per(param[:size] || 30)
  end
end
