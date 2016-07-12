# frozen_string_literal: true
# Achievements handler
class AchievementsController < AuthenticatedController
  # GET /achievements

  def index
    @achievements = current_user.badges
  end

  # GET /achievements/1
  def show
    @achievement = Merit::Badge.find(params[:id].to_i)
    @users = @achievement.users if @achievement
  end
end
