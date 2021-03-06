# frozen_string_literal: true
# :nodoc:
class IssuesController < AuthenticatedController
  before_action :set_issue, only: [:show, :edit, :update, :destroy, :open, :close,
                                   :upvote, :unvote]

  # GET /issues
  # GET /issues.json
  def index
    authorize Issue
    @issues = Issue.order(:updated_at).page params[:page]
  end

  # GET /issues/1
  # GET /issues/1.json
  def show
    authorize @issue
    @assignee = User.find(@issue.assignee_id) if @issue.assignee_id
    @votes = @issue.votes.count
    @have_voted = Vote.find_by(user: current_user, issue: @issue)
    @comment = find_if_exist_or_new
  end

  # GET /issues/new
  def new
    @issue = Issue.new(user_id: current_user.id)
    authorize @issue
  end

  # GET /issues/1/edit
  def edit
    authorize @issue
  end

  # POST /issues
  # POST /issues.json
  def create
    @issue = Issue.new(issue_params)
    authorize @issue
    respond_to do |format|
      if @issue.save
        add_taking_responsibility_badge_if_met @issue
        format.html { redirect_to @issue, notice: I18n.t('issue.create_message') }
        format.json { render :show, status: :created, location: @issue }
      else
        format.html { render :new }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /issues/1
  # PATCH/PUT /issues/1.json
  def update
    authorize @issue
    respond_to do |format|
      if @issue.update(issue_params)
        add_taking_responsibility_badge_if_met @issue
        format.html { redirect_to @issue, notice: I18n.t('issue.update_message') }
        format.json { render :show, status: :ok, location: @issue }
      else
        format.html { render :edit }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /issues/1/open
  def open
    authorize @issue
    respond_to do |format|
      if @issue.update(is_resolved: false)
        @issue.create_activity :issue_opened
        format.html { redirect_to @issue, notice: I18n.t('issue.open_message') }
        format.json { render :show, status: :ok, location: @issue }
      else
        format.html { render :show }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /issues/1/close

  def close
    authorize @issue
    respond_to do |format|
      if @issue.update(is_resolved: true)
        @issue.create_activity :issue_closed
        format.html { redirect_to @issue, notice: I18n.t('issue.close_message') }
        format.json { render :show, status: :ok, location: @issue }
      else
        format.html { render :show }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /issues/1/vote
  def upvote
    authorize @issue
    respond_to do |format|
      if Vote.upvote(current_user, @issue)
        @issue.create_activity :voted
        add_say_yes_badge_if_met
        format.html { redirect_to @issue, notice: I18n.t('issue.vote.success_message') }
        format.json { render :show, status: :ok, location: @issue }
      else
        format.html { render :show }
        format.json { head :no_content }
      end
    end
  end

  # DELETE /issues/1/vote
  def unvote
    authorize @issue
    respond_to do |format|
      if Vote.unvote(current_user, @issue)
        @issue.create_activity :unvote
        format.html { redirect_to @issue, notice: I18n.t('issue.vote.remove_message') }
        format.json { render :show, status: :ok, location: @issue }
      else
        format.html { render :show, notice: '' }
        format.json { head :no_content }
      end
    end
  end

  # DELETE /issues/1
  # DELETE /issues/1.json
  def destroy
    authorize @issue
    @issue.destroy
    respond_to do |format|
      format.html { redirect_to issues_url, notice: I18n.t('issue.destroy_message') }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_issue
    @issue = Issue.find(params[:id])
  end

  def find_if_exist_or_new
    if params[:edit_comment]
      Comment.find params[:edit_comment].to_i
    else
      Comment.new(user_id: current_user.id, issue_id: @issue.id)
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def issue_params
    params.require(:issue).permit(:title, :description, :is_resolved,
                                  :user_id, :due_date, :assignee_id, :issue_type_id)
  end

  def add_taking_responsibility_badge_if_met(issue)
    if Issue.count_by_assignee(issue.assignee_id) == 10
      user_assigned = User.find(issue.assignee_id)
      user_assigned.add_badge 7 # taking_responsibility
    end
  end

  def add_say_yes_badge_if_met
    return if Vote.count_by_voter(current_user) != 10
    current_user.add_badge 10 # say_yes
  end
end
