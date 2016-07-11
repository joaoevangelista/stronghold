class AchievementsController < AuthenticatedController

  # GET /achievements

  def index
    @achievements = current_user.badges
  end

  # GET /achievements/1
  def show
    @users = Merit::Badge.find(params[:id]).users
  end
end
