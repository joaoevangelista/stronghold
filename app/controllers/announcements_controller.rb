# frozen_string_literal: true
# :nodoc:
class AnnouncementsController < AuthenticatedController
  before_action :authenticate_user!, only: [:mark_as_read_by]
  before_action :set_announcement, only: [:show, :edit, :update, :destroy, :mark_as_read_by]

  # GET /announcements
  # GET /announcements.json
  def index
    @announcements = Announcement.order(:updated_at).page params[:page]
  end

  # GET /announcements/1
  # GET /announcements/1.json
  def show
    @read = Read.exists? announcement_id: @announcement.id, user_id: current_user.id
  end

  # GET /announcements/new
  def new
    @announcement = Announcement.new(user_id: current_user.id)
  end

  # GET /announcements/1/edit
  def edit
  end

  # POST /announcements
  # POST /announcements.json
  def create
    @announcement = Announcement.new(announcement_params)

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
      respond_to do |_format|
        format_save read
      end
    else
      format_already_marked read
    end
  end

  private

  def format_save(read)
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

  def format_already_marked(_read)
    respond_to do |format|
      format.html do
        redirect_to @announcement,
                    warning_notice: I18n.t('announcement.already_marked_message')
      end
      format.json { head :no_content }
    end
  end

  def redirect_back_if_not_found
    respond_to do |format|
      format.html do
        redirect_to(announcements_url,
                    error_notice: I18n.t('announcement.not_found')) unless @announcement
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
end
