# frozen_string_literal: true
class ActivityController < AuthenticatedController
  def index
    @activities = Kaminari.paginate_array(PublicActivity::Activity.all)
                          .page(params[:page]).per(params[:size] || 30)
  end
end
