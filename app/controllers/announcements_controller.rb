# frozen_string_literal: true
# :nodoc:
class AnnouncementsController < AuthenticatedController
  before_action :authenticate_user!, only: [:mark_as_read_by]
  before_action :set_announcement, only: [:show, :edit, :update, :destroy, :mark_as_read_by]

  # GET /announcements
  # GET /announcements.json
  def index
    authorize Announcement
    @announcements = Announcement.order(:updated_at).page params[:page]
  end

  # GET /announcements/1
  # GET /announcements/1.json
  def show
    authorize @announcement
    @read = Read.exists? announcement_id: @announcement.id, user_id: current_user.id
  end

  # GET /announcements/new
  def new
    @announcement = Announcement.new(user_id: current_user.id)
    authorize @announcement
  end

  # GET /announcements/1/edit
  def edit
  end

  # POST /announcements
  # POST /announcements.json
  def create
    @announcement = Announcement.new(announcement_params)
    authorize @announcement
    respond_to do |format|
      if @announcement.save
        format.html do
          redirect_to @announcement, notice: I18n.t('announcement.create_message')
        end
        format.json { render :show, status: :created, location: @announcement }
      else
        format.html { render :new }
        format.json { render json: @announcement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /announcements/1
  # PATCH/PUT /announcements/1.json
  def update
    authorize @announcement
    respond_to do |format|
      if @announcement.update(announcement_params)
        format.html do
          redirect_to @announcement, notice: I18n.t('announcement.update_message')
        end
        format.json { render :show, status: :ok, location: @announcement }
      else
        format.html { render :edit }
        format.json { render json: @announcement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /announcements/1
  # DELETE /announcements/1.json
  def destroy
    authorize @announcement
    @announcement.destroy
    respond_to do |format|
      format.html do
        redirect_to announcements_url, notice: I18n.t('announcement.destroy_message')
      end
      format.json { head :no_content }
    end
  end

  def mark_as_read_by
    redirect_back_if_not_found
    @read = Read.exists? announcement_id: @announcement.id, user_id: current_user.id
    if !@read
      read = Read.new(announcement_id: @announcement.id, user_id: current_user.id)
      add_first_class_badge_if_met
      format_save read
    else
      format_already_marked
    end
  end

  private

  def format_save(read)
    respond_to do |format|
      if read.save
        format.html do
          redirect_to @announcement, notice: I18n.t('announcement.marked_as_read')
        end
        format.json { head :ok }
      else
        format.html { render :new }
        format.json { render json: @announcement.errors, status: :unprocessable_entity }
      end
    end
  end

  def format_already_marked
    respond_to do |format|
      format.html do
        flash[:warning] = I18n.t('announcement.already_marked_message')
        redirect_to @announcement
      end
      format.json { head :no_content }
    end
  end

  def redirect_back_if_not_found
    respond_to do |format|
      format.html do
        unless @announcement
          flash[:error] = I18n.t('announcement.not_found')
          redirect_to announcements_url
        end
      end
      format.json { head :not_found } unless @announcement
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_announcement
    @announcement = Announcement.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def announcement_params
    params.require(:announcement).permit(:title, :description, :user_id, :notify)
  end

  def add_first_class_badge_if_met
    if Read.count_by_user(current_user) == 10
      current_user.add_badge 3 # first_class
    end
  end
  def add_changes_badge_if_met
    if Read.count_by_user(current_user) == 25
      current_user.add_badge 12 # changes
    end

  end
end
