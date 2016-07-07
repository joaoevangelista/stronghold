# frozen_string_literal: true
# :nodoc:
class ActivityController < AuthenticatedController
  def index
    @activities = Kaminari.paginate_array(PublicActivity::Activity.order('created_at DESC'))
                                          .page(params[:page]).per(10)

  end
end
